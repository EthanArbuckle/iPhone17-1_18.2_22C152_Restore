@interface ACTSelectPopupVariant
- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4;
- (NSString)intendedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSelectPopupVariant

- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTSelectPopupVariant;
  v7 = [(ACTSelectPopupVariant *)&v11 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    intendedKey = v7->_intendedKey;
    v7->_intendedKey = v8;

    v7->_timestamp = a4;
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(ACTSelectPopupVariant *)self intendedKey];
  [(ACTSelectPopupVariant *)self timestamp];
  v7 = +[NSString stringWithFormat:@"<%@: intended=%@, t=%.2f>", v4, v5, v6];

  return v7;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(ACTSelectPopupVariant *)self intendedKey];
  [(ACTSelectPopupVariant *)self timestamp];
  id v8 = objc_msgSend(v9, "_performVariantKey:timestamp:typingLog:", v7, v6);
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:@"select popup: %@ ", self->_intendedKey];
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end