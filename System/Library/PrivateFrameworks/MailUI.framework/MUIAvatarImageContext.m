@interface MUIAvatarImageContext
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddressConvertible)emailAddress;
- (EFFuture)brandIndicatorFuture;
- (EMCachingContactStore)contactStore;
- (EMCategory)category;
- (MUIAvatarImageContext)initWithCategory:(id)a3 emailAddress:(id)a4 businessLogoID:(id)a5 isAuthenticated:(BOOL)a6 contactStore:(id)a7 brandIndicatorFuture:(id)a8;
- (MUIAvatarImageContext)initWithMessageListItem:(id)a3 contactStore:(id)a4 brandIndicatorProvider:(id)a5;
- (NSString)businessLogoID;
- (NSString)ef_publicDescription;
- (unint64_t)hash;
- (void)setBrandIndicatorFuture:(id)a3;
@end

@implementation MUIAvatarImageContext

- (MUIAvatarImageContext)initWithMessageListItem:(id)a3 contactStore:(id)a4 brandIndicatorProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 category];
  v12 = [v10 senderList];
  v13 = [v12 firstObject];
  v14 = [v10 businessLogoID];
  uint64_t v15 = [v10 isAuthenticated];
  v16 = [v10 brandIndicatorLocation];

  v17 = [v8 brandIndicatorFutureForLocation:v16];

  v18 = [(MUIAvatarImageContext *)self initWithCategory:v11 emailAddress:v13 businessLogoID:v14 isAuthenticated:v15 contactStore:v9 brandIndicatorFuture:v17];
  return v18;
}

- (MUIAvatarImageContext)initWithCategory:(id)a3 emailAddress:(id)a4 businessLogoID:(id)a5 isAuthenticated:(BOOL)a6 contactStore:(id)a7 brandIndicatorFuture:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MUIAvatarImageContext;
  v18 = [(MUIAvatarImageContext *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_category, a3);
    objc_storeStrong((id *)&v19->_emailAddress, a4);
    objc_storeStrong((id *)&v19->_businessLogoID, a5);
    v19->_isAuthenticated = a6;
    objc_storeStrong((id *)&v19->_contactStore, a7);
    objc_storeStrong((id *)&v19->_brandIndicatorFuture, a8);
  }

  return v19;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MUIAvatarImageContext *)self emailAddress];
  v6 = [v5 emailAddressValue];
  v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "ef_publicDescription");
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F60E00];
    id v10 = [v5 stringValue];
    id v8 = [v9 fullyOrPartiallyRedactedStringForString:v10];
  }
  v11 = [(MUIAvatarImageContext *)self category];
  v12 = objc_msgSend(v11, "ef_publicDescription");
  v13 = [(MUIAvatarImageContext *)self businessLogoID];
  BOOL v14 = [(MUIAvatarImageContext *)self isAuthenticated];
  id v15 = [(MUIAvatarImageContext *)self brandIndicatorFuture];
  if (v15) {
    id v16 = @"is";
  }
  else {
    id v16 = @"is not";
  }
  id v17 = [v3 stringWithFormat:@"<%@: %p> emailAddress %@ category %@ businessLogoID %@ isAuthenticated %d brandIndicatorFuture %@ present", v4, self, v8, v12, v13, v14, v16];

  return (NSString *)v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MUIAvatarImageContext *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if ([(MUIAvatarImageContext *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      v6 = [(MUIAvatarImageContext *)v5 category];
      v7 = [(MUIAvatarImageContext *)self category];
      if ([v6 isEqual:v7])
      {
        id v8 = [(MUIAvatarImageContext *)v5 emailAddress];
        id v9 = [(MUIAvatarImageContext *)self emailAddress];
        if ([v8 isEqual:v9])
        {
          BOOL v10 = [(MUIAvatarImageContext *)v5 isAuthenticated];
          int v11 = v10 ^ [(MUIAvatarImageContext *)self isAuthenticated] ^ 1;
        }
        else
        {
          int v11 = 0;
        }
      }
      else
      {
        int v11 = 0;
      }

      v13 = [(MUIAvatarImageContext *)v5 businessLogoID];
      if (v13)
      {

        if ((v11 & 1) == 0)
        {
          char v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        BOOL v14 = [(MUIAvatarImageContext *)self businessLogoID];

        if (v14) {
          char v12 = 0;
        }
        else {
          char v12 = v11;
        }
        if (!v14 || ((v11 ^ 1) & 1) != 0) {
          goto LABEL_20;
        }
      }
      id v15 = [(MUIAvatarImageContext *)v5 businessLogoID];
      id v16 = [(MUIAvatarImageContext *)self businessLogoID];
      char v12 = [v15 isEqual:v16];

      goto LABEL_20;
    }
    char v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(MUIAvatarImageContext *)self category];
  uint64_t v4 = [v3 hash];

  v5 = [(MUIAvatarImageContext *)self emailAddress];
  uint64_t v6 = 33 * (33 * v4 + [v5 hash]);

  unint64_t v7 = v6 + [(MUIAvatarImageContext *)self isAuthenticated] + 35937;
  id v8 = [(MUIAvatarImageContext *)self businessLogoID];

  if (v8)
  {
    id v9 = [(MUIAvatarImageContext *)self businessLogoID];
    unint64_t v7 = [v9 hash] + 33 * v7;
  }
  return v7;
}

- (EMCategory)category
{
  return self->_category;
}

- (ECEmailAddressConvertible)emailAddress
{
  return self->_emailAddress;
}

- (NSString)businessLogoID
{
  return self->_businessLogoID;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (EFFuture)brandIndicatorFuture
{
  return self->_brandIndicatorFuture;
}

- (void)setBrandIndicatorFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandIndicatorFuture, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_businessLogoID, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end