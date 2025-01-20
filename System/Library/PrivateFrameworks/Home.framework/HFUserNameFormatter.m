@interface HFUserNameFormatter
+ (int64_t)_contactFormatterStyleForUserNameStyle:(unint64_t)a3;
- (CNContactFormatter)contactFormatter;
- (HFUserNameFormatter)init;
- (HFUserNameFormatter)initWithHome:(id)a3;
- (HMHome)home;
- (id)stringForObjectValue:(id)a3;
- (unint64_t)style;
- (void)setStyle:(unint64_t)a3;
@end

@implementation HFUserNameFormatter

- (HFUserNameFormatter)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFUserNameFormatter;
  v6 = [(HFUserNameFormatter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x263EFEA20]);
    contactFormatter = v7->_contactFormatter;
    v7->_contactFormatter = v8;

    [(HFUserNameFormatter *)v7 setStyle:2];
  }

  return v7;
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    uint64_t v4 = [(id)objc_opt_class() _contactFormatterStyleForUserNameStyle:a3];
    id v5 = [(HFUserNameFormatter *)self contactFormatter];
    [v5 setStyle:v4];
  }
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

+ (int64_t)_contactFormatterStyleForUserNameStyle:(unint64_t)a3
{
  if (a3 == 1) {
    return 1000;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

- (id)stringForObjectValue:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v11 = 0;
    goto LABEL_16;
  }
  if ([(HFUserNameFormatter *)self style])
  {
    id v5 = (void *)MEMORY[0x263EFEA20];
    v6 = [(HFUserNameFormatter *)self contactFormatter];
    v7 = objc_msgSend(v5, "descriptorForRequiredKeysForStyle:", objc_msgSend(v6, "style"));

    v8 = +[HFContactStore defaultStore];
    v18[0] = v7;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v10 = [v8 contactForUserHandle:v4 withKeys:v9];

    objc_super v11 = [(HFUserNameFormatter *)self contactFormatter];
    v12 = [v11 stringFromContact:v10];

    if ([v12 length])
    {
      id v13 = v12;
    }
    else
    {
      uint64_t v15 = [v4 type];
      if (v15 == 1)
      {
        v16 = @"HFUserNameFormatterFallbackOtherUserContactName";
      }
      else
      {
        if (v15)
        {
LABEL_14:

          goto LABEL_15;
        }
        v16 = @"HFUserNameFormatterFallbackCurrentUserContactName";
      }
      _HFLocalizedStringWithDefaultValue(v16, v16, 1);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_super v11 = v13;
    goto LABEL_14;
  }
  v7 = [(HFUserNameFormatter *)self home];
  v14 = objc_msgSend(v7, "hf_userForHandle:", v4);
  objc_super v11 = [v14 name];

LABEL_15:
LABEL_16:

  return v11;
}

- (HFUserNameFormatter)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUserNameFormatter.m", 26, @"%s is unavailable; use %@ instead",
    "-[HFUserNameFormatter init]",
    v5);

  return 0;
}

- (unint64_t)style
{
  return self->_style;
}

- (HMHome)home
{
  return self->_home;
}

@end