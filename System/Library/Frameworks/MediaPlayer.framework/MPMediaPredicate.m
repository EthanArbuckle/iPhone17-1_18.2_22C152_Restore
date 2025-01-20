@interface MPMediaPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateEntity:(id)a3;
- (MPMediaPredicate)initWithCoder:(id)a3;
- (MPMediaPredicate)initWithProtobufferDecodableObject:(id)a3;
- (MPMediaPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (id)protobufferEncodableObject;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMediaPredicate

- (BOOL)evaluateEntity:(id)a3
{
  v4 = [a3 valueForKey:@"persistentID"];
  v5 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:@"persistentID"];
  v6 = [MPMediaQuery alloc];
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self, v5, 0);
  v8 = [(MPMediaQuery *)v6 initWithFilterPredicates:v7];

  LOBYTE(v7) = [(MPMediaQuery *)v8 _hasItems];
  return (char)v7;
}

- (id)protobufferEncodableObject
{
  return [(MPMediaPredicate *)self protobufferEncodableObjectFromLibrary:0];
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  return 0;
}

- (MPMediaPredicate)initWithProtobufferDecodableObject:(id)a3
{
  return [(MPMediaPredicate *)self initWithProtobufferDecodableObject:a3 library:0];
}

- (MPMediaPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MPMediaPredicate)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end