@interface AXAuditDeviceSetting
+ (id)allKnownIdentifiers;
+ (id)createWithIdentifier:(id)a3 currentValue:(id)a4 settingType:(unint64_t)a5;
+ (void)registerTransportableObjectWithManager:(id)a3;
- (AXAuditDeviceSetting)init;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (NSNumber)currentValueNumber;
- (NSString)description;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sliderTickMarks;
- (unint64_t)hash;
- (unint64_t)settingType;
- (void)setCurrentValueNumber:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setSettingType:(unint64_t)a3;
- (void)setSliderTickMarks:(int64_t)a3;
@end

@implementation AXAuditDeviceSetting

+ (id)allKnownIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"INVERT_COLORS", @"INCREASE_CONTRAST", @"REDUCE_MOTION", @"KEYBOARD_ACCESS", @"REDUCE_TRANSPARENCY", @"ENABLE_CAPTIONS", @"DYNAMIC_TYPE", @"BOLD_FONTS", @"ON_OFF_LABELS", @"BUTTON_SHAPES", @"GRAYSCALE", @"DIFFERENTIATE_WITHOUT_COLOR", 0);
}

+ (id)createWithIdentifier:(id)a3 currentValue:(id)a4 settingType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setIdentifier:v9];

  [v10 setSettingType:a5];
  [v10 setCurrentValueNumber:v8];

  [v10 setEnabled:1];

  return v10;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3 = a3;
  id v9 = [[AXAuditObjectTransportInfoPropertyBased alloc] initWithClass:objc_opt_class() transportKey:@"AXAuditDeviceSetting_v1"];
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v4];
  [(AXAuditObjectTransportPropertyEntry *)v4 setTransportKey:@"IdentiifierValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v4 setLocalValueToTransportValue:&__block_literal_global];
  [(AXAuditObjectTransportPropertyEntry *)v4 setPopulateLocalObjectWithTransportValue:&__block_literal_global_46];
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v5];
  [(AXAuditObjectTransportPropertyEntry *)v5 setTransportKey:@"CurrentValueNumber_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v5 setLocalValueToTransportValue:&__block_literal_global_53];
  [(AXAuditObjectTransportPropertyEntry *)v5 setPopulateLocalObjectWithTransportValue:&__block_literal_global_56];
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v6];
  [(AXAuditObjectTransportPropertyEntry *)v6 setTransportKey:@"SettingTypeValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v6 setLocalValueToTransportValue:&__block_literal_global_62];
  [(AXAuditObjectTransportPropertyEntry *)v6 setPopulateLocalObjectWithTransportValue:&__block_literal_global_64];
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v7];
  [(AXAuditObjectTransportPropertyEntry *)v7 setTransportKey:@"EnabledValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v7 setLocalValueToTransportValue:&__block_literal_global_69];
  [(AXAuditObjectTransportPropertyEntry *)v7 setPopulateLocalObjectWithTransportValue:&__block_literal_global_71];
  id v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  [(AXAuditObjectTransportInfoPropertyBased *)v9 addPropertyEntry:v8];
  [(AXAuditObjectTransportPropertyEntry *)v8 setTransportKey:@"SliderTickMarksValue_v1"];
  [(AXAuditObjectTransportPropertyEntry *)v8 setLocalValueToTransportValue:&__block_literal_global_78];
  [(AXAuditObjectTransportPropertyEntry *)v8 setPopulateLocalObjectWithTransportValue:&__block_literal_global_80];
  [v3 registerTransportInfoPropertyBased:v9];
}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setIdentifier:v4];
  }
}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 currentValueNumber];
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setCurrentValueNumber:v4];
  }
}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 settingType];

  return [v2 numberWithUnsignedLongLong:v3];
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setSettingType:", objc_msgSend(v4, "integerValue"));
  }
}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 enabled];

  return [v2 numberWithBool:v3];
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "BOOLValue"));
  }
}

uint64_t __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 sliderTickMarks];

  return [v2 numberWithInteger:v3];
}

void __63__AXAuditDeviceSetting_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "setSliderTickMarks:", objc_msgSend(v4, "integerValue"));
  }
}

- (AXAuditDeviceSetting)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXAuditDeviceSetting;
  result = [(AXAuditDeviceSetting *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(AXAuditDeviceSetting *)self identifier];
  [v4 setIdentifier:v5];

  objc_msgSend(v4, "setSettingType:", -[AXAuditDeviceSetting settingType](self, "settingType"));
  objc_msgSend(v4, "setEnabled:", -[AXAuditDeviceSetting enabled](self, "enabled"));
  objc_msgSend(v4, "setSliderTickMarks:", -[AXAuditDeviceSetting sliderTickMarks](self, "sliderTickMarks"));
  v6 = [(AXAuditDeviceSetting *)self currentValueNumber];
  [v4 setCurrentValueNumber:v6];

  return v4;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)AXAuditDeviceSetting;
  objc_super v3 = [(AXAuditDeviceSetting *)&v8 description];
  id v4 = [(AXAuditDeviceSetting *)self identifier];
  id v5 = [(AXAuditDeviceSetting *)self currentValueNumber];
  v6 = [v3 stringByAppendingFormat:@"identifier:%@ value:%@ type:%i", v4, v5, -[AXAuditDeviceSetting settingType](self, "settingType")];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AXAuditDeviceSetting *)self settingType];
  id v4 = [(AXAuditDeviceSetting *)self identifier];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(AXAuditDeviceSetting *)self currentValueNumber];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = v7 + [(AXAuditDeviceSetting *)self enabled];
  unint64_t v9 = v5 ^ (v8 + [(AXAuditDeviceSetting *)self sliderTickMarks]);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXAuditDeviceSetting *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t v6 = [(AXAuditDeviceSetting *)self settingType];
      if (v6 == [(AXAuditDeviceSetting *)v5 settingType])
      {
        uint64_t v7 = [(AXAuditDeviceSetting *)self identifier];
        uint64_t v8 = [(AXAuditDeviceSetting *)v5 identifier];
        if (v7 | v8 && ![(id)v7 isEqual:v8])
        {
          BOOL v12 = 0;
        }
        else
        {
          uint64_t v9 = [(AXAuditDeviceSetting *)self currentValueNumber];
          uint64_t v10 = [(AXAuditDeviceSetting *)v5 currentValueNumber];
          if ((!(v9 | v10) || [(id)v9 isEqual:v10])
            && (BOOL v11 = [(AXAuditDeviceSetting *)self enabled],
                v11 == [(AXAuditDeviceSetting *)v5 enabled]))
          {
            int64_t v13 = [(AXAuditDeviceSetting *)self sliderTickMarks];
            BOOL v12 = v13 == [(AXAuditDeviceSetting *)v5 sliderTickMarks];
          }
          else
          {
            BOOL v12 = 0;
          }
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)currentValueNumber
{
  return self->_currentValueNumber;
}

- (void)setCurrentValueNumber:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unint64_t)settingType
{
  return self->_settingType;
}

- (void)setSettingType:(unint64_t)a3
{
  self->_settingType = a3;
}

- (int64_t)sliderTickMarks
{
  return self->_sliderTickMarks;
}

- (void)setSliderTickMarks:(int64_t)a3
{
  self->_sliderTickMarks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValueNumber, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end