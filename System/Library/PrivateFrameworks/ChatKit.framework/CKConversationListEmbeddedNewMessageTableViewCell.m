@interface CKConversationListEmbeddedNewMessageTableViewCell
- (CKConversationListEmbeddedNewMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CKConversationListEmbeddedNewMessageTableViewCell

- (CKConversationListEmbeddedNewMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKConversationListEmbeddedNewMessageTableViewCell;
  v4 = [(CKConversationListNewMessageCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CKConversationListEmbeddedNewMessageTableViewCell *)v4 setUserInteractionEnabled:1];
  }
  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CKConversationListEmbeddedNewMessageTableViewCell;
  v5 = -[CKConversationListEmbeddedNewMessageTableViewCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v6 = [(CKConversationListNewMessageCell *)self closeButton];
  if (v5 == v6) {
    objc_super v7 = v5;
  }
  else {
    objc_super v7 = 0;
  }
  id v8 = v7;

  return v8;
}

@end