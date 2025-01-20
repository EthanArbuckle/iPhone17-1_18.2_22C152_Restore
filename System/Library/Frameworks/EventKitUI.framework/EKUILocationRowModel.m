@interface EKUILocationRowModel
- (EKStructuredLocation)location;
- (EKUILocationRowModel)initWithConferenceRoom:(id)a3;
- (EKUILocationRowModel)initWithPendingConference:(id)a3;
- (EKUILocationRowModel)initWithStructuredLocation:(id)a3;
- (EKUILocationRowModel)initWithSuggestedLocation:(id)a3;
- (EKUILocationRowModel)initWithType:(unint64_t)a3 location:(id)a4 conference:(id)a5;
- (EKUILocationRowModel)initWithVirtualConference:(id)a3;
- (EKVirtualConference)conference;
- (UITableViewCell)cell;
- (id)description;
- (unint64_t)locationType;
- (void)setCell:(id)a3;
- (void)setConference:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLocationType:(unint64_t)a3;
@end

@implementation EKUILocationRowModel

- (EKUILocationRowModel)initWithConferenceRoom:(id)a3
{
  v4 = [MEMORY[0x1E4F25630] locationWithTitle:a3];
  v5 = [(EKUILocationRowModel *)self initWithType:0 location:v4 conference:0];

  return v5;
}

- (EKUILocationRowModel)initWithSuggestedLocation:(id)a3
{
  v4 = [MEMORY[0x1E4F25630] locationWithTitle:a3];
  v5 = [(EKUILocationRowModel *)self initWithType:3 location:v4 conference:0];

  return v5;
}

- (EKUILocationRowModel)initWithStructuredLocation:(id)a3
{
  return [(EKUILocationRowModel *)self initWithType:1 location:a3 conference:0];
}

- (EKUILocationRowModel)initWithVirtualConference:(id)a3
{
  return [(EKUILocationRowModel *)self initWithType:2 location:0 conference:a3];
}

- (EKUILocationRowModel)initWithPendingConference:(id)a3
{
  return [(EKUILocationRowModel *)self initWithType:2 location:0 conference:0];
}

- (EKUILocationRowModel)initWithType:(unint64_t)a3 location:(id)a4 conference:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKUILocationRowModel;
  v11 = [(EKUILocationRowModel *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_locationType = a3;
    objc_storeStrong((id *)&v11->_location, a4);
    objc_storeStrong((id *)&v12->_conference, a5);
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [NSNumber numberWithUnsignedInteger:self->_locationType];
  v5 = [v3 stringWithFormat:@"EKUILocationRowModel: locationType: %@, location: %@, conference: %@, cell: %@", v4, self->_location, self->_conference, self->_cell];

  return v5;
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unint64_t)a3
{
  self->_locationType = a3;
}

- (EKStructuredLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (EKVirtualConference)conference
{
  return self->_conference;
}

- (void)setConference:(id)a3
{
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_conference, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end