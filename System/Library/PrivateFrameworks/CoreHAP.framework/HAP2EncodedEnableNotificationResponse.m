@interface HAP2EncodedEnableNotificationResponse
- (HAP2EncodedEnableNotificationResponse)initWithNotificationResponses:(id)a3;
- (HAP2EncodedEnableNotificationResponse)initWithNotificationResponses:(id)a3 updatedValues:(id)a4;
- (NSSet)updatedValues;
@end

@implementation HAP2EncodedEnableNotificationResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueResponses, 0);

  objc_storeStrong((id *)&self->_updatedValues, 0);
}

- (NSSet)updatedValues
{
  return self->_updatedValues;
}

- (HAP2EncodedEnableNotificationResponse)initWithNotificationResponses:(id)a3 updatedValues:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2EncodedEnableNotificationResponse;
  v8 = [(HAP2EncodedCharacteristicResponse *)&v11 initWithCharacteristics:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_updatedValues, a4);
  }

  return v9;
}

- (HAP2EncodedEnableNotificationResponse)initWithNotificationResponses:(id)a3
{
  return [(HAP2EncodedEnableNotificationResponse *)self initWithNotificationResponses:a3 updatedValues:0];
}

@end