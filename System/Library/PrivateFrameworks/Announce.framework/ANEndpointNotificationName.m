@interface ANEndpointNotificationName
+ (id)getEffectiveNotificationNameFromNotificationName:(id)a3 endpointID:(id)a4;
+ (id)getNotificationNameForEndpointID:(id)a3;
@end

@implementation ANEndpointNotificationName

+ (id)getNotificationNameForEndpointID:(id)a3
{
  return +[ANEndpointNotificationName getEffectiveNotificationNameFromNotificationName:kANAnnounceStateNotificationKey endpointID:a3];
}

+ (id)getEffectiveNotificationNameFromNotificationName:(id)a3 endpointID:(id)a4
{
  id v4 = a3;

  return v4;
}

@end