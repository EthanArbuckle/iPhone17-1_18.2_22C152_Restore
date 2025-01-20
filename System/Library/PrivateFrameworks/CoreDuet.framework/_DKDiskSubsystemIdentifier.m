@interface _DKDiskSubsystemIdentifier
+ (id)type;
+ (id)withDiskSubsystem:(id)a3;
@end

@implementation _DKDiskSubsystemIdentifier

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:a1];
}

+ (id)withDiskSubsystem:(id)a3
{
  id v4 = a3;
  v5 = [a1 type];
  v6 = +[_DKIdentifier identifierWithString:v4 type:v5];

  return v6;
}

@end