@interface MDMRequestClasses
+ (Class)classForRequestType:(id)a3;
@end

@implementation MDMRequestClasses

+ (Class)classForRequestType:(id)a3
{
  uint64_t v3 = classForRequestType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&classForRequestType__onceToken, &__block_literal_global_4);
  }
  v5 = [(id)classForRequestType__requestClassByRequestType objectForKeyedSubscript:v4];

  return (Class)v5;
}

void __41__MDMRequestClasses_classForRequestType___block_invoke()
{
  id v26 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:12];
  uint64_t v0 = objc_opt_class();
  v1 = +[MDMRequestClearRestrictionsPasswordCommand requestType];
  [v26 setObject:v0 forKeyedSubscript:v1];

  uint64_t v2 = objc_opt_class();
  uint64_t v3 = +[MDMRequestDeviceLocationCommand requestType];
  [v26 setObject:v2 forKeyedSubscript:v3];

  uint64_t v4 = objc_opt_class();
  v5 = +[MDMRequestDeviceLockCommand requestType];
  [v26 setObject:v4 forKeyedSubscript:v5];

  uint64_t v6 = objc_opt_class();
  v7 = +[MDMRequestDisableLostModeCommand requestType];
  [v26 setObject:v6 forKeyedSubscript:v7];

  uint64_t v8 = objc_opt_class();
  v9 = +[MDMRequestEnableLostModeCommand requestType];
  [v26 setObject:v8 forKeyedSubscript:v9];

  uint64_t v10 = objc_opt_class();
  v11 = +[MDMRequestEraseDeviceCommand requestType];
  [v26 setObject:v10 forKeyedSubscript:v11];

  uint64_t v12 = objc_opt_class();
  v13 = +[MDMRequestLogOutUserCommand requestType];
  [v26 setObject:v12 forKeyedSubscript:v13];

  uint64_t v14 = objc_opt_class();
  v15 = +[MDMRequestPlayLostModeSoundCommand requestType];
  [v26 setObject:v14 forKeyedSubscript:v15];

  uint64_t v16 = objc_opt_class();
  v17 = +[MDMRequestRestartDeviceCommand requestType];
  [v26 setObject:v16 forKeyedSubscript:v17];

  uint64_t v18 = objc_opt_class();
  v19 = +[MDMRequestSecurityInfoCommand requestType];
  [v26 setObject:v18 forKeyedSubscript:v19];

  uint64_t v20 = objc_opt_class();
  v21 = +[MDMRequestShutDownDeviceCommand requestType];
  [v26 setObject:v20 forKeyedSubscript:v21];

  uint64_t v22 = objc_opt_class();
  v23 = +[MDMRequestUserListCommand requestType];
  [v26 setObject:v22 forKeyedSubscript:v23];

  uint64_t v24 = [v26 copy];
  v25 = (void *)classForRequestType__requestClassByRequestType;
  classForRequestType__requestClassByRequestType = v24;
}

@end