@interface CNPRUISPosterAttachment
- (CNPRUISPosterAttachment)initWithAttachment:(id)a3;
- (PRUISPosterAttachment)attachment;
@end

@implementation CNPRUISPosterAttachment

- (void).cxx_destruct
{
}

- (PRUISPosterAttachment)attachment
{
  return self->_attachment;
}

- (CNPRUISPosterAttachment)initWithAttachment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISPosterAttachment;
  v6 = [(CNPRUISPosterAttachment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attachment, a3);
  }

  return v7;
}

@end