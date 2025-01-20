@interface CUIKSuggestionCoalescedInfo
- (CUIKSuggestionCoalescedInfo)initWithTitle:(id)a3 descriptionText:(id)a4 earliestSuggestionNotification:(id)a5;
- (EKCalendarSuggestionNotification)earliestSuggestionNotification;
- (NSString)descriptionText;
- (NSString)title;
@end

@implementation CUIKSuggestionCoalescedInfo

- (CUIKSuggestionCoalescedInfo)initWithTitle:(id)a3 descriptionText:(id)a4 earliestSuggestionNotification:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CUIKSuggestionCoalescedInfo;
  v12 = [(CUIKSuggestionCoalescedInfo *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_descriptionText, a4);
    objc_storeStrong((id *)&v13->_earliestSuggestionNotification, a5);
    v14 = v13;
  }

  return v13;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)descriptionText
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (EKCalendarSuggestionNotification)earliestSuggestionNotification
{
  return (EKCalendarSuggestionNotification *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestSuggestionNotification, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end