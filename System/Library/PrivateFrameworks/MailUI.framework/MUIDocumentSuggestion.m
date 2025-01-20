@interface MUIDocumentSuggestion
+ (id)suggestionWithFileURL:(id)a3 name:(id)a4 date:(id)a5 subject:(id)a6 authors:(id)a7 authorEmailAddresses:(id)a8 objectID:(id)a9 messageList:(id)a10;
- (MUIDocumentSuggestion)initWithFileURL:(id)a3 name:(id)a4 date:(id)a5 subject:(id)a6 authors:(id)a7 authorEmailAddresses:(id)a8 objectID:(id)a9 messageList:(id)a10;
- (NSDate)date;
- (NSString)name;
- (NSString)subject;
- (NSURL)fileURL;
- (id)category;
- (id)description;
@end

@implementation MUIDocumentSuggestion

+ (id)suggestionWithFileURL:(id)a3 name:(id)a4 date:(id)a5 subject:(id)a6 authors:(id)a7 authorEmailAddresses:(id)a8 objectID:(id)a9 messageList:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = (void *)[objc_alloc((Class)a1) initWithFileURL:v24 name:v23 date:v22 subject:v21 authors:v20 authorEmailAddresses:v19 objectID:v18 messageList:v17];

  return v25;
}

- (MUIDocumentSuggestion)initWithFileURL:(id)a3 name:(id)a4 date:(id)a5 subject:(id)a6 authors:(id)a7 authorEmailAddresses:(id)a8 objectID:(id)a9 messageList:(id)a10
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v17 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MUIDocumentSuggestion;
  id v18 = [(MUIResultSuggestion *)&v24 initWithObjectID:a9 messageList:a10 authors:a7 authorEmailAddresses:a8];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fileURL, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_date, a5);
    objc_storeStrong((id *)&v19->_subject, a6);
  }

  return v19;
}

- (id)category
{
  return +[MUISearchSuggestionCategory documentCategory];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  date = self->_date;
  fileURL = self->_fileURL;
  v8 = [(MUIResultSuggestion *)self authors];
  v9 = [(MUIResultSuggestion *)self authorEmailAddresses];
  v10 = [(MUIResultSuggestion *)self objectID];
  v11 = [(MUIResultSuggestion *)self messageList];
  v12 = [v3 stringWithFormat:@"<%@: %p> name=%@ date=%@ fileURL=%@ authors=%@ authorEmailAddresses=%@ objectID=%@ messageList=%@", v4, self, name, date, fileURL, v8, v9, v10, v11];

  return v12;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)subject
{
  return self->_subject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end