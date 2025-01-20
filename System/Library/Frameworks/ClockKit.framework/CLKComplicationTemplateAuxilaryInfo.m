@interface CLKComplicationTemplateAuxilaryInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsComplicationForegroundModifier;
- (CLKComplicationTemplateAuxilaryInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsComplicationForegroundModifier:(BOOL)a3;
@end

@implementation CLKComplicationTemplateAuxilaryInfo

- (CLKComplicationTemplateAuxilaryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTemplateAuxilaryInfo;
  v5 = [(CLKComplicationTemplateAuxilaryInfo *)&v7 init];
  if (v5) {
    v5->_supportsComplicationForegroundModifier = [v4 decodeBoolForKey:@"SupportsComplicationForegroundModifierKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsComplicationForegroundModifier
{
  return self->_supportsComplicationForegroundModifier;
}

- (void)setSupportsComplicationForegroundModifier:(BOOL)a3
{
  self->_supportsComplicationForegroundModifier = a3;
}

@end