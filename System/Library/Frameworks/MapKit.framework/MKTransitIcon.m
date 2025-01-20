@interface MKTransitIcon
- (GEOStyleAttributes)styleAttributes;
- (MKTransitIcon)initWithCartoId:(unsigned int)a3 defaultTransitType:(unsigned int)a4;
- (MKTransitIcon)initWithKey:(unsigned int)a3 value:(unsigned int)a4;
- (int)iconType;
- (unsigned)cartoID;
- (unsigned)defaultTransitType;
- (unsigned)iconAttributeKey;
- (unsigned)iconAttributeValue;
@end

@implementation MKTransitIcon

- (MKTransitIcon)initWithCartoId:(unsigned int)a3 defaultTransitType:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MKTransitIcon;
  v6 = [(MKTransitIcon *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_cartoID = a3;
    v6->_defaultTransitType = a4;
    v8 = v6;
  }

  return v7;
}

- (int)iconType
{
  return 0;
}

- (MKTransitIcon)initWithKey:(unsigned int)a3 value:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MKTransitIcon;
  v6 = [(MKTransitIcon *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_iconAttributeKey = a3;
    v6->_iconAttributeValue = a4;
    v8 = v6;
  }

  return v7;
}

- (unsigned)iconAttributeKey
{
  return self->_iconAttributeKey;
}

- (unsigned)iconAttributeValue
{
  return self->_iconAttributeValue;
}

- (GEOStyleAttributes)styleAttributes
{
  styleAttributes = self->_styleAttributes;
  if (!styleAttributes)
  {
    if (self->_iconAttributeKey)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F64AA8]);
      id v5 = objc_alloc_init(MEMORY[0x1E4F64AA0]);
      [v5 setKey:self->_iconAttributeKey];
      [v5 setValue:self->_iconAttributeValue];
      [v4 addAttribute:v5];
      v6 = self->_styleAttributes;
      self->_styleAttributes = (GEOStyleAttributes *)v4;

      styleAttributes = self->_styleAttributes;
    }
    else
    {
      styleAttributes = 0;
    }
  }

  return styleAttributes;
}

- (unsigned)cartoID
{
  return self->_cartoID;
}

- (unsigned)defaultTransitType
{
  return self->_defaultTransitType;
}

- (void).cxx_destruct
{
}

@end