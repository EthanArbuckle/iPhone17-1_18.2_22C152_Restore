@interface EKDayViewContentItemStateWrapper
+ (id)wrapperWithContentItem:(id)a3 viewContent:(id)a4;
- (BOOL)isDimmed;
- (BOOL)isMiniPreviewInEventDetail;
- (BOOL)isProposedTime;
- (BOOL)isSelected;
- (BOOL)occurrenceIsFirstVisibleDayOfEvent;
- (BOOL)usesSmallText;
- (CGRect)backgroundRect;
- (EKDayViewContentItemStateWrapper)initWithContentItem:(id)a3 viewContent:(id)a4;
- (EKEvent)occurrence;
- (NSArray)occurrences;
- (NSNumber)allDayOverride;
- (UITraitCollection)traitCollection;
- (double)travelTime;
- (double)travelTimeHeight;
- (double)visibleHeight;
- (int64_t)birthdayCount;
- (int64_t)horizontalSizeClass;
- (int64_t)userInterfaceStyle;
@end

@implementation EKDayViewContentItemStateWrapper

- (CGRect)backgroundRect
{
  [(EKDayViewContentItem *)self->_item stagedFrame];
  double v4 = v3;
  [(EKDayViewContentItem *)self->_item stagedFrame];
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)visibleHeight
{
  [(EKDayViewContentItem *)self->_item visibleHeight];
  return result;
}

- (BOOL)usesSmallText
{
  return [(EKDayViewContentItem *)self->_item usesSmallText];
}

- (double)travelTime
{
  [(EKDayViewContentItem *)self->_item travelTime];
  return result;
}

- (double)travelTimeHeight
{
  [(EKDayViewContentItem *)self->_item travelTimeHeight];
  return result;
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)[(EKDayViewContent *)self->_content traitCollection];
}

- (NSArray)occurrences
{
  return [(EKDayViewContentItem *)self->_item events];
}

- (BOOL)occurrenceIsFirstVisibleDayOfEvent
{
  return [(EKDayViewContentItem *)self->_item occurrenceIsFirstVisibleDayOfEvent];
}

- (BOOL)isProposedTime
{
  return [(EKDayViewContentItem *)self->_item isProposedTime];
}

- (BOOL)isMiniPreviewInEventDetail
{
  return [(EKDayViewContent *)self->_content isMiniPreviewInEventDetail];
}

- (int64_t)birthdayCount
{
  return 0;
}

- (NSNumber)allDayOverride
{
  return (NSNumber *)MEMORY[0x1E4F1CC28];
}

- (BOOL)isSelected
{
  v2 = [(EKDayViewContentItem *)self->_item view];
  char v3 = [v2 selected];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (BOOL)isDimmed
{
  if ([(EKDayViewContentItem *)self->_item isProposedTime]) {
    return 1;
  }
  double v4 = [(EKDayViewContentItem *)self->_item event];
  double v5 = [(EKDayViewContent *)self->_content dimmedOccurrence];
  char v6 = [v4 isEqual:v5];

  return v6;
}

+ (id)wrapperWithContentItem:(id)a3 viewContent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [[EKDayViewContentItemStateWrapper alloc] initWithContentItem:v6 viewContent:v5];

  return v7;
}

- (EKDayViewContentItemStateWrapper)initWithContentItem:(id)a3 viewContent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKDayViewContentItemStateWrapper;
  v9 = [(EKDayViewContentItemStateWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_content, a4);
  }

  return v10;
}

- (int64_t)horizontalSizeClass
{
  v2 = [(EKDayViewContent *)self->_content traitCollection];
  int64_t v3 = [v2 horizontalSizeClass];

  return v3;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(EKDayViewContent *)self->_content traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (EKEvent)occurrence
{
  return [(EKDayViewContentItem *)self->_item event];
}

@end