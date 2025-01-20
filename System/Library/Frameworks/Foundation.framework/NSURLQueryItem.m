@interface NSURLQueryItem
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSURLQueryItem)allocWithZone:(_NSZone *)a3;
+ (NSURLQueryItem)queryItemWithName:(NSString *)name value:(NSString *)value;
+ (id)_queryItem;
+ (id)_queryItemWithName:(id)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)value;
- (NSURLQueryItem)init;
- (NSURLQueryItem)initWithCoder:(id)a3;
- (NSURLQueryItem)initWithName:(NSString *)name value:(NSString *)value;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLQueryItem

+ (NSURLQueryItem)queryItemWithName:(NSString *)name value:(NSString *)value
{
  v4 = (void *)[objc_allocWithZone((Class)a1) initWithName:name value:value];

  return (NSURLQueryItem *)v4;
}

+ (id)_queryItemWithName:(id)a3 value:(id)a4
{
  id v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  if (a4)
  {
    id v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }
  else
  {
    id v8 = 0;
  }
  v10 = (objc_class *)type metadata accessor for _NSSwiftURLQueryItem();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR____NSSwiftURLQueryItem_queryItem];
  *(void *)v12 = v5;
  *((void *)v12 + 1) = v7;
  *((void *)v12 + 2) = v8;
  *((void *)v12 + 3) = a4;
  uint64_t v13 = String._bridgeToObjectiveCImpl()();
  if (a4) {
    v14 = (void *)String._bridgeToObjectiveCImpl()();
  }
  else {
    v14 = 0;
  }
  v17.receiver = v11;
  v17.super_class = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = objc_msgSendSuper2(&v17, sel_initWithName_value_, v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v15;
}

+ (NSURLQueryItem)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSURLQueryItem == a1) {
    return (NSURLQueryItem *)&___immutablePlaceholderURLQueryItem;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSURLQueryItem;
  return (NSURLQueryItem *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (id)_queryItem
{
  v2 = (objc_class *)type metadata accessor for _NSSwiftURLQueryItem();
  v3 = (char *)objc_allocWithZone(v2);
  objc_super v4 = &v3[OBJC_IVAR____NSSwiftURLQueryItem_queryItem];
  *(void *)objc_super v4 = 0;
  *((void *)v4 + 1) = 0xE000000000000000;
  *((void *)v4 + 2) = 0;
  *((void *)v4 + 3) = 0;
  uint64_t v5 = String._bridgeToObjectiveCImpl()();
  v8.receiver = v3;
  v8.super_class = v2;
  id v6 = objc_msgSendSuper2(&v8, sel_initWithName_value_, v5, 0);
  swift_unknownObjectRelease();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_11;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  uint64_t v5 = [(NSURLQueryItem *)self name];
  uint64_t v6 = [a3 name];
  if (v5 == (NSString *)v6 || (BOOL v7 = [(NSString *)v5 isEqual:v6]))
  {
    objc_super v8 = [(NSURLQueryItem *)self value];
    uint64_t v9 = [a3 value];
    if (v8 != (NSString *)v9)
    {
      LOBYTE(v7) = [(NSString *)v8 isEqual:v9];
      return v7;
    }
LABEL_11:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(NSURLQueryItem *)self name] hash];
  return [(NSString *)[(NSURLQueryItem *)self value] hash] + v3;
}

- (NSURLQueryItem)init
{
  return [(NSURLQueryItem *)self initWithName:&stru_1ECA5C228 value:0];
}

- (NSURLQueryItem)initWithName:(NSString *)name value:(NSString *)value
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSURLQueryItem;
  uint64_t v6 = [(NSURLQueryItem *)&v9 init];
  if (v6)
  {
    if (name) {
      BOOL v7 = name;
    }
    else {
      BOOL v7 = (NSString *)&stru_1ECA5C228;
    }
    v6->_name = (NSString *)[(NSString *)v7 copy];
    v6->_value = (NSString *)[(NSString *)value copy];
  }
  return v6;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p> {name = %@, value = %@}", objc_opt_class(), self, [(NSURLQueryItem *)self name], [(NSURLQueryItem *)self value]];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ cannot be encoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSURLQueryItem name](self, "name"), @"NS.name");
  uint64_t v5 = [(NSURLQueryItem *)self value];

  [a3 encodeObject:v5 forKey:@"NS.value"];
}

- (NSURLQueryItem)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@ cannot be decoded by non-keyed archivers", objc_opt_class()];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.name"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.value"];
  if (v6 && (uint64_t v8 = v7, _NSIsNSString()) && (!v8 || _NSIsNSString()))
  {
    uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.name"];
    uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.value"];
    return [(NSURLQueryItem *)self initWithName:v9 value:v10];
  }
  else
  {
    id v12 = +[NSError _readCorruptErrorWithFormat:@"%@: invalid archived object", _NSMethodExceptionProem((objc_class *)self, a2)];

    [a3 failWithError:v12];
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)value
{
  return self->_value;
}

@end