@interface BBBulletin(MatchID)
- (id)sectionMatchID;
- (uint64_t)matchesPublisherBulletinID:()MatchID andRecordID:;
@end

@implementation BBBulletin(MatchID)

- (id)sectionMatchID
{
  v2 = [a1 universalSectionID];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 sectionID];
  }
  v5 = v4;

  return v5;
}

- (uint64_t)matchesPublisherBulletinID:()MatchID andRecordID:
{
  if (a3) {
    v7 = a3;
  }
  else {
    v7 = a4;
  }
  id v8 = v7;
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 publisherMatchID];
  uint64_t v12 = [v11 isEqualToString:v8];

  return v12;
}

@end