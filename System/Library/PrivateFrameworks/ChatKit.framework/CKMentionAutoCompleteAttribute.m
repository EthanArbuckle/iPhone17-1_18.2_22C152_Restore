@interface CKMentionAutoCompleteAttribute
- (CKMentionAutoCompleteAttribute)initWithMentionEntityNode:(id)a3 originalText:(id)a4 displayText:(id)a5;
- (CKMentionEntityNode)mentionEntityNode;
- (NSString)displayText;
- (NSString)originalText;
- (void)setDisplayText:(id)a3;
- (void)setMentionEntityNode:(id)a3;
- (void)setOriginalText:(id)a3;
@end

@implementation CKMentionAutoCompleteAttribute

- (CKMentionAutoCompleteAttribute)initWithMentionEntityNode:(id)a3 originalText:(id)a4 displayText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CKMentionAutoCompleteAttribute;
  v12 = [(CKMentionAutoCompleteAttribute *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mentionEntityNode, a3);
    uint64_t v14 = [v10 copy];
    originalText = v13->_originalText;
    v13->_originalText = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    displayText = v13->_displayText;
    v13->_displayText = (NSString *)v16;
  }
  return v13;
}

- (CKMentionEntityNode)mentionEntityNode
{
  return self->_mentionEntityNode;
}

- (void)setMentionEntityNode:(id)a3
{
}

- (NSString)originalText
{
  return self->_originalText;
}

- (void)setOriginalText:(id)a3
{
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_originalText, 0);

  objc_storeStrong((id *)&self->_mentionEntityNode, 0);
}

@end