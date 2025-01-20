@interface PHContactViewController
- (CHHandle)handle;
- (CHRecentCall)recentCall;
- (id)primaryPropertyKey;
- (void)setHandle:(id)a3;
- (void)setRecentCall:(id)a3;
@end

@implementation PHContactViewController

- (id)primaryPropertyKey
{
  v15.receiver = self;
  v15.super_class = (Class)PHContactViewController;
  v3 = [(PHContactViewController *)&v15 primaryPropertyKey];
  v4 = [(PHContactViewController *)self recentCall];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 handleType];
    if ((unint64_t)v6 < 2)
    {
      id v8 = 0;
    }
    else
    {
      if (v6 == (id)2)
      {
        v7 = (id *)&CNContactPhoneNumbersKey;
      }
      else
      {
        if (v6 != (id)3) {
          goto LABEL_10;
        }
        v7 = (id *)&CNContactEmailAddressesKey;
      }
      id v8 = *v7;
    }

    v3 = v8;
  }
LABEL_10:
  v9 = [(PHContactViewController *)self handle];
  v10 = v9;
  if (!v9) {
    goto LABEL_19;
  }
  id v11 = [v9 type];
  if ((unint64_t)v11 < 2)
  {
    id v13 = 0;
  }
  else
  {
    if (v11 == (id)2)
    {
      v12 = (id *)&CNContactPhoneNumbersKey;
    }
    else
    {
      if (v11 != (id)3) {
        goto LABEL_19;
      }
      v12 = (id *)&CNContactEmailAddressesKey;
    }
    id v13 = *v12;
  }

  v3 = v13;
LABEL_19:

  return v3;
}

- (void)setRecentCall:(id)a3
{
  v5 = (CHRecentCall *)a3;
  p_recentCall = &self->_recentCall;
  if (self->_recentCall != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)p_recentCall, a3);
    v7 = [(CHRecentCall *)v19 callerId];
    if (![v7 length])
    {
LABEL_13:

      v5 = v19;
      goto LABEL_14;
    }
    id v8 = [(CHRecentCall *)v19 handleType];
    if (v8 == (id)3)
    {
      id v13 = [(PHContactViewController *)self contact];
      v10 = [v13 labeledValueForEmailAddress:v7];

      id v11 = (id *)&CNContactEmailAddressesKey;
    }
    else
    {
      if (v8 == (id)2)
      {
        v16 = [(CHRecentCall *)v19 isoCountryCode];
        v17 = +[CNPhoneNumber phoneNumberWithDigits:v7 countryCode:v16];

        if (v17)
        {
          v18 = [(PHContactViewController *)self contact];
          v10 = [v18 labeledValueForPhoneNumber:v17];

          v12 = CNContactPhoneNumbersKey;
        }
        else
        {
          v12 = 0;
          v10 = 0;
        }

        if (!v10) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      if (v8 != (id)1 || !v7)
      {
        v10 = 0;
        v12 = 0;
        goto LABEL_12;
      }
      v9 = [(PHContactViewController *)self contact];
      v10 = [v9 labeledValueForSocialProfileWithUsername:v7];

      id v11 = (id *)&CNContactSocialProfilesKey;
    }
    v12 = (NSString *)*v11;
    if (v10)
    {
LABEL_11:
      v14 = [v10 identifier];
      unsigned int v15 = [(CHRecentCall *)v19 callStatus];
      [(PHContactViewController *)self highlightPropertyWithKey:v12 identifier:v14 important:v15 == kCHCallStatusMissed];
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

  _objc_release_x1(p_recentCall, v5);
}

- (void)setHandle:(id)a3
{
  v5 = (CHHandle *)a3;
  p_handle = &self->_handle;
  if (self->_handle != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)p_handle, a3);
    id v7 = [(CHHandle *)v18 type];
    if (v7 == (id)3)
    {
      v12 = [(PHContactViewController *)self contact];
      id v13 = [(CHHandle *)v18 value];
      v10 = [v12 labeledValueForEmailAddress:v13];

      v14 = CNContactEmailAddressesKey;
      if (!v10) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (v7 == (id)2)
    {
      unsigned int v15 = [(CHHandle *)v18 value];
      id v8 = +[CNPhoneNumber phoneNumberWithStringValue:v15];

      if (v8)
      {
        v16 = [(PHContactViewController *)self contact];
        v10 = [v16 labeledValueForPhoneNumber:v8];

        id v11 = (id *)&CNContactPhoneNumbersKey;
        goto LABEL_11;
      }
    }
    else
    {
      if (v7 != (id)1)
      {
        v10 = 0;
        v14 = 0;
        goto LABEL_16;
      }
      id v8 = [(CHHandle *)v18 value];
      if (v8)
      {
        v9 = [(PHContactViewController *)self contact];
        v10 = [v9 labeledValueForSocialProfileWithUsername:v8];

        id v11 = (id *)&CNContactSocialProfilesKey;
LABEL_11:
        v14 = (NSString *)*v11;
        goto LABEL_14;
      }
    }
    v14 = 0;
    v10 = 0;
LABEL_14:

    if (v10)
    {
LABEL_15:
      v17 = [v10 identifier];
      [(PHContactViewController *)self highlightPropertyWithKey:v14 identifier:v17 important:0];
    }
LABEL_16:

    v5 = v18;
  }

  _objc_release_x1(p_handle, v5);
}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (CHHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end