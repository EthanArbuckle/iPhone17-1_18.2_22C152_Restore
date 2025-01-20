@interface DOCRemoteUIBarButtonItem
- (BOOL)isEqual:(id)a3;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUuid:(id)a3;
@end

@implementation DOCRemoteUIBarButtonItem

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(DOCRemoteUIBarButtonItem *)self uuid];
    v6 = [v4 uuid];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [DOCRemoteUIBarButtonItem alloc];
  uint64_t v6 = [(DOCRemoteUIBarButtonItem *)self style];
  char v7 = [(DOCRemoteUIBarButtonItem *)self title];
  v8 = (void *)[v7 copyWithZone:a3];

  v9 = [(DOCRemoteUIBarButtonItem *)self image];
  v10 = [(DOCRemoteUIBarButtonItem *)self landscapeImagePhone];
  if (![(DOCRemoteUIBarButtonItem *)self isSystemItem])
  {
    if (v8)
    {
      uint64_t v12 = [(DOCRemoteUIBarButtonItem *)v5 initWithTitle:v8 style:v6 target:0 action:0];
    }
    else if (v9 && v10)
    {
      uint64_t v12 = [(DOCRemoteUIBarButtonItem *)v5 initWithImage:v9 landscapeImagePhone:v10 style:v6 target:0 action:0];
    }
    else
    {
      if (!v9) {
        goto LABEL_11;
      }
      uint64_t v12 = [(DOCRemoteUIBarButtonItem *)v5 initWithImage:v9 style:v6 target:0 action:0];
    }
    v5 = (DOCRemoteUIBarButtonItem *)v12;
    goto LABEL_11;
  }
  v11 = v5;
  v5 = [(DOCRemoteUIBarButtonItem *)v11 initWithBarButtonSystemItem:[(DOCRemoteUIBarButtonItem *)self systemItem] target:0 action:0];

LABEL_11:
  v13 = [(DOCRemoteUIBarButtonItem *)self uuid];
  v14 = (void *)[v13 copyWithZone:a3];
  [(DOCRemoteUIBarButtonItem *)v5 setUuid:v14];

  v15 = [(DOCRemoteUIBarButtonItem *)self target];
  [(DOCRemoteUIBarButtonItem *)v5 setTarget:v15];

  [(DOCRemoteUIBarButtonItem *)v5 setAction:[(DOCRemoteUIBarButtonItem *)self action]];
  [(DOCRemoteUIBarButtonItem *)v5 setEnabled:[(DOCRemoteUIBarButtonItem *)self isEnabled]];
  v16 = [(DOCRemoteUIBarButtonItem *)self possibleTitles];
  v17 = (void *)[v16 copyWithZone:a3];
  [(DOCRemoteUIBarButtonItem *)v5 setPossibleTitles:v17];

  [(DOCRemoteUIBarButtonItem *)self width];
  -[DOCRemoteUIBarButtonItem setWidth:](v5, "setWidth:");
  [(DOCRemoteUIBarButtonItem *)self imageInsets];
  -[DOCRemoteUIBarButtonItem setImageInsets:](v5, "setImageInsets:");
  [(DOCRemoteUIBarButtonItem *)self landscapeImagePhoneInsets];
  -[DOCRemoteUIBarButtonItem setLandscapeImagePhoneInsets:](v5, "setLandscapeImagePhoneInsets:");
  v18 = [(DOCRemoteUIBarButtonItem *)self accessibilityLabel];
  [(DOCRemoteUIBarButtonItem *)v5 setAccessibilityLabel:v18];

  v19 = [(DOCRemoteUIBarButtonItem *)self accessibilityHint];
  [(DOCRemoteUIBarButtonItem *)v5 setAccessibilityHint:v19];

  v20 = [(DOCRemoteUIBarButtonItem *)self menuRepresentation];
  [(DOCRemoteUIBarButtonItem *)v5 setMenuRepresentation:v20];

  v21 = +[DOCRemoteUIBarButtonItemRegistry shared];
  [v21 registerInstance:v5];

  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 400, 1);
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end