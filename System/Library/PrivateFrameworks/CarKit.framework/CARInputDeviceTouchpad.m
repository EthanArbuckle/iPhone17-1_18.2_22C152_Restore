@interface CARInputDeviceTouchpad
+ (CGSize)physicalSizeForTouchpadWithDigitizerProperties:(id)a3;
- (BOOL)_characterRecognitionSupportedForServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)characterRecognitionSupported;
- (BOOL)feedbackSupported;
- (CARInputDeviceTouchpad)initWithServiceClient:(__IOHIDServiceClient *)a3 UUID:(id)a4 settings:(id)a5 delegate:(id)a6;
- (CARInputDeviceTouchpadDelegate)delegate;
- (CGSize)_physicalSizeForTouchpadServiceClient:(__IOHIDServiceClient *)a3;
- (CGSize)physicalSize;
- (double)sensitivity;
- (id)_initWithSupportedHapticTypes:(unint64_t)a3 physicalSize:(CGSize)a4 characterRecognitionSupported:(BOOL)a5 senderID:(unint64_t)a6 UUID:(id)a7;
- (id)description;
- (unint64_t)supportedFeedbackTypes;
- (void)_setDelegate:(id)a3;
- (void)performFeedbackOfType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setSensitivity:(double)a3;
- (void)updateSettingsWithSettings:(id)a3;
@end

@implementation CARInputDeviceTouchpad

- (CARInputDeviceTouchpad)initWithServiceClient:(__IOHIDServiceClient *)a3 UUID:(id)a4 settings:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CARInputDeviceTouchpad;
  v12 = [(CARInputDevice *)&v22 initWithServiceClient:a3 UUID:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    v14 = [v10 objectForKey:@"touchpadSensitivity"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v16 = 0.5;
    if (isKindOfClass)
    {
      objc_msgSend(v14, "floatValue", 0.5);
      double v16 = v17;
    }
    v13->_sensitivity = v16;
    [(CARInputDeviceTouchpad *)v13 _physicalSizeForTouchpadServiceClient:a3];
    v13->_physicalSize.width = v18;
    v13->_physicalSize.height = v19;
    v13->_characterRecognitionSupported = [(CARInputDeviceTouchpad *)v13 _characterRecognitionSupportedForServiceClient:a3];
    v20 = [v10 objectForKey:@"supportedHapticFeedbackTypes"];
    v13->_supportedFeedbackTypes = [v20 unsignedIntegerValue];
  }
  return v13;
}

- (BOOL)feedbackSupported
{
  return self->_supportedFeedbackTypes != 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(CARInputDevice *)self senderID];
  v6 = [(CARInputDevice *)self UUID];
  [(CARInputDeviceTouchpad *)self physicalSize];
  uint64_t v8 = v7;
  [(CARInputDeviceTouchpad *)self physicalSize];
  uint64_t v10 = v9;
  if ([(CARInputDeviceTouchpad *)self characterRecognitionSupported]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  [(CARInputDeviceTouchpad *)self sensitivity];
  v13 = [v3 stringWithFormat:@"<%@: %p, senderID: %llu, UUID: %@, width: %.2f cm, height: %.2f cm, characterRecognition: %@, sensitivity: %.2f", v4, self, v5, v6, v8, v10, v11, v12];

  return v13;
}

- (void)updateSettingsWithSettings:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"touchpadSensitivity"];
  if (v4)
  {
    id v6 = v4;
    [v4 floatValue];
    [(CARInputDeviceTouchpad *)self setSensitivity:v5];
    uint64_t v4 = v6;
  }
}

- (void)performFeedbackOfType:(unint64_t)a3
{
  if (([(CARInputDeviceTouchpad *)self supportedFeedbackTypes] & a3) != 0)
  {
    id v6 = [(CARInputDeviceTouchpad *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      float v5 = [(CARInputDevice *)self UUID];
      [v6 performHapticType:a3 deviceUUID:v5];
    }
  }
}

- (CGSize)_physicalSizeForTouchpadServiceClient:(__IOHIDServiceClient *)a3
{
  v3 = (void *)IOHIDServiceClientCopyProperty(a3, @"Digitizer");
  +[CARInputDeviceTouchpad physicalSizeForTouchpadWithDigitizerProperties:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)physicalSizeForTouchpadWithDigitizerProperties:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v39 = [a3 objectForKey:@"Transducers"];
  v38 = [v39 firstObject];
  v3 = [v38 objectForKey:@"Elements"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    double v7 = @"Usage";
    double v8 = @"Unit";
    double v9 = 0.0;
    double v10 = 0.0;
    uint64_t v40 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v13 = [v12 objectForKey:v7];
        uint64_t v14 = [v13 integerValue];

        if ((v14 & 0xFFFFFFFFFFFFFFFELL) == 0x30)
        {
          v15 = [v12 objectForKey:v8];
          __int16 v16 = [v15 unsignedIntegerValue];

          if ((v16 & 0xFFF0) == 0x10)
          {
            float v17 = v7;
            CGFloat v18 = v3;
            CGFloat v19 = v8;
            uint64_t v20 = v16 & 0xF;
            v21 = [v12 objectForKey:@"UnitExponent"];
            char v22 = [v21 integerValue];

            char v23 = v22 | 0xF0;
            if ((v22 & 8) == 0) {
              char v23 = v22;
            }
            int v24 = v23;
            v25 = [v12 objectForKey:@"ScaledMax"];
            [v25 floatValue];
            float v27 = v26;
            v28 = [v12 objectForKey:@"ScaledMin"];
            [v28 floatValue];
            double v30 = (float)(v27 - v29);

            double v31 = v30 * __exp10f((float)v24);
            if (v20 == 3) {
              double v31 = v31 * 2.54;
            }
            if (v14 == 48)
            {
              double v10 = v31;
            }
            else if (v14 == 49)
            {
              double v9 = v31;
            }
            double v8 = v19;
            v3 = v18;
            double v7 = v17;
            uint64_t v6 = v40;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v5);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
  }
  BOOL v32 = v9 != 0.0;
  BOOL v33 = v10 != 0.0;
  if (v32 && v33) {
    double v34 = v9;
  }
  else {
    double v34 = 4.0;
  }
  if (v32 && v33) {
    double v35 = v10;
  }
  else {
    double v35 = 4.0;
  }

  double v36 = v35;
  double v37 = v34;
  result.height = v37;
  result.width = v36;
  return result;
}

- (BOOL)_characterRecognitionSupportedForServiceClient:(__IOHIDServiceClient *)a3
{
  v3 = (void *)IOHIDServiceClientCopyProperty(a3, @"Unicode");
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_initWithSupportedHapticTypes:(unint64_t)a3 physicalSize:(CGSize)a4 characterRecognitionSupported:(BOOL)a5 senderID:(unint64_t)a6 UUID:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CARInputDeviceTouchpad;
  uint64_t v14 = [(CARInputDeviceTouchpad *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(CARInputDevice *)v14 _setUUID:v13];
    [(CARInputDevice *)v15 _setSenderID:a6];
    v15->_physicalSize.CGFloat width = width;
    v15->_physicalSize.CGFloat height = height;
    v15->_characterRecognitionSupported = a5;
    v15->_supportedFeedbackTypes = a3;
  }

  return v15;
}

- (void)_setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    uint64_t v6 = obj;
  }
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(double)a3
{
  self->_sensitivity = a3;
}

- (CGSize)physicalSize
{
  double width = self->_physicalSize.width;
  double height = self->_physicalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)characterRecognitionSupported
{
  return self->_characterRecognitionSupported;
}

- (unint64_t)supportedFeedbackTypes
{
  return self->_supportedFeedbackTypes;
}

- (CARInputDeviceTouchpadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CARInputDeviceTouchpadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end