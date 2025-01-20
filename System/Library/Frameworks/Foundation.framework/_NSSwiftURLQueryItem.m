@interface _NSSwiftURLQueryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)value;
- (_NSSwiftURLQueryItem)initWithCoder:(id)a3;
- (_NSSwiftURLQueryItem)initWithName:(id)a3 value:(id)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSSwiftURLQueryItem

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSString)value
{
  if (*(void *)&self->queryItem[OBJC_IVAR____NSSwiftURLQueryItem_queryItem]) {
    v2 = (void *)String._bridgeToObjectiveCImpl()();
  }
  else {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)name
{
  v2 = (void *)String._bridgeToObjectiveCImpl()();

  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  return @objc _NSSwiftURLComponents.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_NSSwiftURLQueryItem.isEqual(_:));
}

- (id)copyWithZone:(void *)a3
{
  return (id)@objc _NSSwiftURLComponents.copy(with:)(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))_NSSwiftURLQueryItem.copy(with:));
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = _NSSwiftURLQueryItem.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSSwiftURLQueryItem)initWithCoder:(id)a3
{
  return (_NSSwiftURLQueryItem *)_NSSwiftURLQueryItem.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(NSURLQueryItem *)&v4 encodeWithCoder:a3];
}

- (_NSSwiftURLQueryItem)initWithName:(id)a3 value:(id)a4
{
  result = (_NSSwiftURLQueryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end