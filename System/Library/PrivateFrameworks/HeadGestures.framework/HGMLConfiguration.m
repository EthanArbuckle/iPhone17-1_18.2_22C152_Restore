@interface HGMLConfiguration
- (HGMLConfiguration)init;
- (HGMLConfigurationInternal)internal;
- (void)setInternal:(id)a3;
@end

@implementation HGMLConfiguration

- (HGMLConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)HGMLConfiguration;
  v2 = [(HGMLConfiguration *)&v5 init];
  if (v2)
  {
    v3 = +[HGMLConfigurationInternal defaultMLConfiguration];
    [(HGMLConfiguration *)v2 setInternal:v3];
  }
  return v2;
}

- (HGMLConfigurationInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end