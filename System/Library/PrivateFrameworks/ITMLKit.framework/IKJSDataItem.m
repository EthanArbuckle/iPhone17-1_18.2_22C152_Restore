@interface IKJSDataItem
+ (id)makeDataItem:(id)a3 :(id)a4;
- (IKJSDataItem)init;
- (IKJSDataItem)initWithType:(id)a3;
- (IKJSDataItem)initWithType:(id)a3 identifier:(id)a4;
- (IKJSDataItem)initWithValue:(id)a3;
- (NSDictionary)dataDictionary;
- (NSString)identifier;
- (NSString)prototypeIdentifier;
- (NSString)type;
- (id)asPrivateIKJSDataItem;
- (void)setIdentifier:(id)a3;
- (void)setPrototypeIdentifier:(id)a3;
@end

@implementation IKJSDataItem

- (id)asPrivateIKJSDataItem
{
  if ([(IKJSDataItem *)self conformsToProtocol:&unk_1F3E55060]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSDataItem)initWithType:(id)a3
{
  return [(IKJSDataItem *)self initWithType:a3 identifier:0];
}

- (IKJSDataItem)initWithType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F30938];
  v9 = +[IKAppContext currentAppContext];
  v10 = [v9 jsContext];
  v11 = [v8 valueWithObject:MEMORY[0x1E4F1CC08] inContext:v10];
  v15.receiver = self;
  v15.super_class = (Class)IKJSDataItem;
  v12 = [(IKJSDataObservable *)&v15 initWithTargetValue:v11];

  if (v12)
  {
    v13 = v6;
    if (!v6)
    {
      v13 = [NSString string];
    }
    objc_storeStrong((id *)&v12->_type, v13);
    if (!v6) {

    }
    objc_storeStrong((id *)&v12->_identifier, a4);
  }

  return v12;
}

- (IKJSDataItem)initWithValue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IKJSDataItem;
  return [(IKJSDataObservable *)&v4 initWithTargetValue:a3];
}

- (IKJSDataItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)IKJSDataItem;
  v2 = [(IKJSDataObservable *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [NSString string];
    type = v2->_type;
    v2->_type = (NSString *)v3;
  }
  return v2;
}

- (NSDictionary)dataDictionary
{
  v4.receiver = self;
  v4.super_class = (Class)IKJSDataItem;
  v2 = [(IKJSDataObservable *)&v4 dataDictionaryObject];
  return (NSDictionary *)v2;
}

+ (id)makeDataItem:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isNull] & 1) != 0
    || ([v6 isUndefined] & 1) != 0
    || [v6 isString])
  {
    id v8 = v6;
    id v9 = v7;
    id v10 = objc_alloc((Class)a1);
    int v11 = [v8 isString];
    if (v11)
    {
      v12 = [v8 toString];
    }
    else
    {
      v12 = 0;
    }
    if ([v9 isString])
    {
      v13 = [v9 toString];
      v14 = (void *)[v10 initWithType:v12 identifier:v13];

      if (!v11) {
        goto LABEL_12;
      }
    }
    else
    {
      v14 = (void *)[v10 initWithType:v12 identifier:0];
      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }

    goto LABEL_12;
  }
  if (!objc_msgSend(v6, "ikdt_isObject") || (objc_msgSend(v6, "ikdt_isArray") & 1) != 0)
  {
    v16 = +[IKAppContext currentAppContext];
    [v16 setException:0, @"DataItem: Invalid args; construct with type and identifier, or an object (not array)" withErrorMessage];

    goto LABEL_18;
  }
  v14 = (void *)[objc_alloc((Class)a1) initWithValue:v6];
LABEL_13:

  if (v14)
  {
    uint64_t v15 = [v14 exportValue];
    goto LABEL_19;
  }
LABEL_18:
  v17 = (void *)MEMORY[0x1E4F30938];
  v14 = [MEMORY[0x1E4F30920] currentContext];
  uint64_t v15 = [v17 valueWithNullInContext:v14];
LABEL_19:
  v18 = (void *)v15;

  return v18;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)prototypeIdentifier
{
  return self->_prototypeIdentifier;
}

- (void)setPrototypeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end