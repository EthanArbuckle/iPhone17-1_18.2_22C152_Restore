@interface BLTBulletinStorageBulletin
- (BBBulletin)bulletin;
- (unint64_t)contextSize;
- (void)setBulletin:(id)a3;
@end

@implementation BLTBulletinStorageBulletin

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
  id v5 = a3;
  id v7 = [v5 context];
  unint64_t v6 = +[BLTObjectSerializer sizeOfObject:v7];

  self->_contextSize = v6;
}

- (unint64_t)contextSize
{
  return self->_contextSize;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void).cxx_destruct
{
}

@end