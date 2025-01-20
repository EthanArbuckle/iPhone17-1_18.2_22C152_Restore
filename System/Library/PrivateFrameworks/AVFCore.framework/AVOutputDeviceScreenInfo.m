@interface AVOutputDeviceScreenInfo
- (AVOutputDeviceScreenInfo)initWithDict:(id)a3;
- (BOOL)cornerMasks;
- (BOOL)isLimitedUI;
- (BOOL)isNightMode;
- (NSArray)inputCapabilities;
- (NSArray)limitedUIElements;
- (NSArray)viewAreas;
- (NSNumber)maxFPS;
- (NSNumber)viewHeightScaleFactor;
- (NSString)ID;
- (NSString)primaryInputDevice;
- (NSURL)applicationURL;
- (NSURL)initialApplicationURL;
- (NSValue)physicalSize;
- (NSValue)pixelSize;
- (NSValue)squarePixelSize;
- (void)dealloc;
@end

@implementation AVOutputDeviceScreenInfo

- (AVOutputDeviceScreenInfo)initWithDict:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)AVOutputDeviceScreenInfo;
  v4 = [(AVOutputDeviceScreenInfo *)&v33 init];
  if (v4)
  {
    v4->_ID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21168]), "copy");
    v4->_inputCapabilities = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21178]), "copy");
    v4->_limitedUI = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21180]), "BOOLValue");
    v4->_limitedUIElements = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21190]), "copy");
    v4->_nightMode = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21188]), "BOOLValue");
    v4->_maxFPS = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21198]), "copy");
    v5 = (void *)MEMORY[0x1E4F29238];
    CFDictionaryRef v6 = (const __CFDictionary *)[a3 objectForKey:*MEMORY[0x1E4F211A0]];
    size.width = 0.0;
    size.height = 0.0;
    if (!CGSizeMakeWithDictionaryRepresentation(v6, &size)) {
      CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
    }
    v4->_physicalSize = (NSValue *)(id)objc_msgSend(v5, "valueWithSize:", size.width, size.height);
    v7 = (void *)MEMORY[0x1E4F29238];
    CFDictionaryRef v8 = (const __CFDictionary *)[a3 objectForKey:*MEMORY[0x1E4F211A8]];
    size.width = 0.0;
    size.height = 0.0;
    if (!CGSizeMakeWithDictionaryRepresentation(v8, &size)) {
      CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
    }
    v4->_pixelSize = (NSValue *)(id)objc_msgSend(v7, "valueWithSize:", size.width, size.height);
    v9 = (void *)MEMORY[0x1E4F29238];
    CFDictionaryRef v10 = (const __CFDictionary *)[a3 objectForKey:*MEMORY[0x1E4F211B8]];
    size.width = 0.0;
    size.height = 0.0;
    if (!CGSizeMakeWithDictionaryRepresentation(v10, &size)) {
      CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
    }
    v4->_squarePixelSize = (NSValue *)(id)objc_msgSend(v9, "valueWithSize:", size.width, size.height);
    v4->_viewHeightScaleFactor = (NSNumber *)(id)[a3 objectForKey:*MEMORY[0x1E4F211C8]];
    v4->_primaryInputDevice = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F211B0]), "copy");
    v26 = v4;
    v4->_cornerMasks = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E4F21160]), "BOOLValue");
    id v25 = a3;
    v11 = (void *)[a3 objectForKey:*MEMORY[0x1E4F211C0]];
    v32 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:&size count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v31 = *(void *)v35;
      uint64_t v29 = *MEMORY[0x1E4F211F0];
      uint64_t v30 = *MEMORY[0x1E4F211E0];
      uint64_t v28 = *MEMORY[0x1E4F211E8];
      uint64_t v14 = *MEMORY[0x1E4F211D8];
      uint64_t v15 = *MEMORY[0x1E4F211D0];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", AVOutputDeviceViewAreaInfoNSRectFromDictionary((const __CFDictionary *)objc_msgSend(v17, "objectForKey:", v30)));
          BOOL v19 = [v17 objectForKey:v29] != 0;
          BOOL v20 = [v17 objectForKey:v28] != 0;
          uint64_t v21 = [v17 objectForKey:v14];
          v22 = -[AVOutputDeviceViewAreaInfo initWithViewArea:transitionControl:supportsFocusTransfer:statusBarEdge:safeArea:]([AVOutputDeviceViewAreaInfo alloc], "initWithViewArea:transitionControl:supportsFocusTransfer:statusBarEdge:safeArea:", v18, v19, v20, v21, objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", AVOutputDeviceViewAreaInfoNSRectFromDictionary((const __CFDictionary *)objc_msgSend(v17, "objectForKey:", v15))));
          [v32 addObject:v22];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:&size count:16];
      }
      while (v13);
    }
    v4 = v26;
    v26->_viewAreas = (NSArray *)v32;
    v26->_applicationURL = (NSURL *)(id)[v25 objectForKey:*MEMORY[0x1E4F21158]];
    v26->_initialApplicationURL = (NSURL *)(id)[v25 objectForKey:*MEMORY[0x1E4F21170]];
    v23 = v26;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceScreenInfo;
  [(AVOutputDeviceScreenInfo *)&v3 dealloc];
}

- (NSString)ID
{
  return self->_ID;
}

- (NSArray)inputCapabilities
{
  return self->_inputCapabilities;
}

- (BOOL)isLimitedUI
{
  return self->_limitedUI;
}

- (NSArray)limitedUIElements
{
  return self->_limitedUIElements;
}

- (BOOL)isNightMode
{
  return self->_nightMode;
}

- (NSNumber)maxFPS
{
  return self->_maxFPS;
}

- (NSValue)physicalSize
{
  return self->_physicalSize;
}

- (NSValue)pixelSize
{
  return self->_pixelSize;
}

- (NSNumber)viewHeightScaleFactor
{
  return self->_viewHeightScaleFactor;
}

- (NSValue)squarePixelSize
{
  return self->_squarePixelSize;
}

- (NSString)primaryInputDevice
{
  return self->_primaryInputDevice;
}

- (BOOL)cornerMasks
{
  return self->_cornerMasks;
}

- (NSArray)viewAreas
{
  return self->_viewAreas;
}

- (NSURL)applicationURL
{
  return self->_applicationURL;
}

- (NSURL)initialApplicationURL
{
  return self->_initialApplicationURL;
}

@end