@interface IKJSUserDefaults
- (IKAppUserDefaultsStoring)userDefaultsStorage;
- (IKJSUserDefaults)initWithAppContext:(id)a3 userDefaultsStorage:(id)a4;
- (id)getData:(id)a3;
- (void)removeData:(id)a3;
- (void)setData:(id)a3 :(id)a4;
- (void)setUserDefaultsStorage:(id)a3;
@end

@implementation IKJSUserDefaults

- (IKJSUserDefaults)initWithAppContext:(id)a3 userDefaultsStorage:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IKJSUserDefaults;
  v7 = [(IKJSObject *)&v10 initWithAppContext:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_userDefaultsStorage, v6);
  }

  return v8;
}

- (id)getData:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F30938];
  id v5 = a3;
  id v6 = [(IKJSObject *)self appContext];
  v7 = [v6 jsContext];
  v8 = [v4 valueWithNullInContext:v7];

  v9 = [(IKJSUserDefaults *)self userDefaultsStorage];
  objc_super v10 = [v9 dataForKey:v5];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F30938];
    v12 = [(IKJSObject *)self appContext];
    v13 = [v12 jsContext];
    uint64_t v14 = [v11 valueWithObject:v10 inContext:v13];

    v8 = (void *)v14;
  }

  return v8;
}

- (void)setData:(id)a3 :(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 isNull])
  {
    v7 = [(IKJSUserDefaults *)self userDefaultsStorage];
    [v7 removeDataForKey:v9];
LABEL_16:

    goto LABEL_17;
  }
  if (([v6 isString] & 1) != 0
    || ([v6 isNumber] & 1) != 0
    || [v6 isBoolean])
  {
    if ([v6 isString])
    {
      v7 = [v6 toString];
    }
    else
    {
      v7 = 0;
    }
    if ([v6 isBoolean] && !v7)
    {
      v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "toBool"));
    }
    if ([v6 isNumber] && !v7)
    {
      v7 = [v6 toNumber];
    }
    v8 = [(IKJSUserDefaults *)self userDefaultsStorage];
    [v8 setData:v7 forKey:v9];

    goto LABEL_16;
  }
LABEL_17:
}

- (void)removeData:(id)a3
{
  id v4 = a3;
  id v5 = [(IKJSUserDefaults *)self userDefaultsStorage];
  [v5 removeDataForKey:v4];
}

- (IKAppUserDefaultsStoring)userDefaultsStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefaultsStorage);
  return (IKAppUserDefaultsStoring *)WeakRetained;
}

- (void)setUserDefaultsStorage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end