@interface _CNKFeatures
+ (_CNKFeatures)sharedInstance;
- (_CNKFeatures)init;
@end

@implementation _CNKFeatures

+ (_CNKFeatures)sharedInstance
{
  if (qword_100034308 != -1) {
    swift_once();
  }
  v2 = (void *)static Features.shared;

  return (_CNKFeatures *)v2;
}

- (_CNKFeatures)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Features();
  return [(_CNKFeatures *)&v3 init];
}

@end