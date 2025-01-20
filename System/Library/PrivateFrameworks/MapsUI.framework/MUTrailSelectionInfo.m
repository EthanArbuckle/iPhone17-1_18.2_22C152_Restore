@interface MUTrailSelectionInfo
- (MUTrailSelectionInfo)initWithTrailID:(unint64_t)a3 trailName:(id)a4;
- (NSString)trailName;
- (unint64_t)trailID;
- (void)setTrailID:(unint64_t)a3;
- (void)setTrailName:(id)a3;
@end

@implementation MUTrailSelectionInfo

- (MUTrailSelectionInfo)initWithTrailID:(unint64_t)a3 trailName:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MUTrailSelectionInfo;
  v7 = [(MUTrailSelectionInfo *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MUTrailSelectionInfo *)v7 setTrailID:a3];
    [(MUTrailSelectionInfo *)v8 setTrailName:v6];
  }

  return v8;
}

- (unint64_t)trailID
{
  return self->_trailID;
}

- (void)setTrailID:(unint64_t)a3
{
  self->_trailID = a3;
}

- (NSString)trailName
{
  return self->_trailName;
}

- (void)setTrailName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end