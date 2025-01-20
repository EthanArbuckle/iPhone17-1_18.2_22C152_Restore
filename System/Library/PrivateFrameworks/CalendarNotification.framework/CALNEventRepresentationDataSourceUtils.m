@interface CALNEventRepresentationDataSourceUtils
+ (id)_userActivityUserInfoForEvent:(id)a3;
+ (void)updateEventRepresentation:(id)a3 forEvent:(id)a4;
@end

@implementation CALNEventRepresentationDataSourceUtils

+ (void)updateEventRepresentation:(id)a3 forEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = [a1 _userActivityUserInfoForEvent:v6];
  [v12 setUserActivityUserInfo:v7];
  v8 = [v12 organizerContactDictionary];

  if (!v8)
  {
    v9 = [v6 organizer];
    v10 = v9;
    if (v9 && ([v9 isCurrentUser] & 1) == 0)
    {
      v11 = [v6 organizer];
      [v12 setOrganizerForContactDictionary:v11];
    }
  }
}

+ (id)_userActivityUserInfoForEvent:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F30540];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithEvent:v4 view:1 forceLocal:1];

  id v6 = [v5 dictionary];

  return v6;
}

@end