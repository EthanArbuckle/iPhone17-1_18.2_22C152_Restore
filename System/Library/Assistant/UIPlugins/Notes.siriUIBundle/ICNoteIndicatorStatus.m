@interface ICNoteIndicatorStatus
- (BOOL)isDisplayedInFolder;
- (ICNoteIndicatorStatus)initWithStatusType:(int64_t)a3 isDisplayedInFolder:(BOOL)a4;
- (NSString)imageName;
- (UIColor)tintColor;
- (int64_t)statusType;
- (void)setIsDisplayedInFolder:(BOOL)a3;
@end

@implementation ICNoteIndicatorStatus

- (ICNoteIndicatorStatus)initWithStatusType:(int64_t)a3 isDisplayedInFolder:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteIndicatorStatus;
  result = [(ICNoteIndicatorStatus *)&v7 init];
  if (result)
  {
    result->_statusType = a3;
    result->_isDisplayedInFolder = a4;
  }
  return result;
}

- (NSString)imageName
{
  switch([(ICNoteIndicatorStatus *)self statusType])
  {
    case 1:
      v3 = @"lock.fill";
      break;
    case 2:
      v3 = @"lock.open.fill";
      break;
    case 3:
      v3 = @"person.crop.circle";
      break;
    case 4:
      unsigned int v4 = [(ICNoteIndicatorStatus *)self isDisplayedInFolder];
      v5 = @"person.crop.circle";
      if (v4) {
        v5 = 0;
      }
      v3 = v5;
      break;
    default:
      v3 = 0;
      break;
  }

  return (NSString *)v3;
}

- (UIColor)tintColor
{
  return +[UIColor secondaryLabelColor];
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (BOOL)isDisplayedInFolder
{
  return self->_isDisplayedInFolder;
}

- (void)setIsDisplayedInFolder:(BOOL)a3
{
  self->_isDisplayedInFolder = a3;
}

@end