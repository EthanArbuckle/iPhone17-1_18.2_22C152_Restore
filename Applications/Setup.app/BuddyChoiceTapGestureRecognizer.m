@interface BuddyChoiceTapGestureRecognizer
- (BuddyChoice)buddyChoice;
- (BuddyChoiceTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 choice:(id)a5;
- (void)setBuddyChoice:(id)a3;
@end

@implementation BuddyChoiceTapGestureRecognizer

- (BuddyChoiceTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 choice:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v13 = a4;
  id obj = 0;
  objc_storeStrong(&obj, a5);
  id v7 = v15;
  id v15 = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyChoiceTapGestureRecognizer;
  v8 = [(BuddyChoiceTapGestureRecognizer *)&v11 initWithTarget:location[0] action:v13];
  id v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8) {
    objc_storeStrong((id *)v15 + 1, obj);
  }
  v9 = (BuddyChoiceTapGestureRecognizer *)v15;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (BuddyChoice)buddyChoice
{
  return self->_buddyChoice;
}

- (void)setBuddyChoice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end