@interface CreateContactView.ContactViewDelegate
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (_TtCV14FamilyCircleUI17CreateContactView19ContactViewDelegate)init;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
@end

@implementation CreateContactView.ContactViewDelegate

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_218A8FFF4(v6, (uint64_t)a4);
}

- (_TtCV14FamilyCircleUI17CreateContactView19ContactViewDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CreateContactView.ContactViewDelegate();
  return [(CreateContactView.ContactViewDelegate *)&v3 init];
}

@end