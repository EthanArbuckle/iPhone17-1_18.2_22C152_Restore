@interface ICSPosterConfigurationWrapper
- (ICSPosterConfigurationWrapper)init;
- (ICSPosterConfigurationWrapper)initWithConfiguration:(id)a3 source:(unint64_t)a4;
- (PRSPosterConfiguration)configuration;
- (PRUISPosterTitleStyleAttributes)titleStyleAttributes;
- (unint64_t)source;
- (void)setTitleStyleAttributes:(id)a3;
@end

@implementation ICSPosterConfigurationWrapper

- (PRSPosterConfiguration)configuration
{
  v2 = sub_10012EE6C();

  return (PRSPosterConfiguration *)v2;
}

- (unint64_t)source
{
  return sub_10012EEC0();
}

- (PRUISPosterTitleStyleAttributes)titleStyleAttributes
{
  v2 = sub_10012EF04();

  return (PRUISPosterTitleStyleAttributes *)v2;
}

- (void)setTitleStyleAttributes:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10012EF90((uint64_t)a3);
}

- (ICSPosterConfigurationWrapper)initWithConfiguration:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  return (ICSPosterConfigurationWrapper *)sub_10012EFA4(a3, a4);
}

- (ICSPosterConfigurationWrapper)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSPosterConfigurationWrapper_titleStyleAttributes);
}

@end