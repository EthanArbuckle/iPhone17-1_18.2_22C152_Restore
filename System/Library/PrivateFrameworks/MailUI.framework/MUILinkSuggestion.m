@interface MUILinkSuggestion
+ (id)suggestionWithURL:(id)a3 title:(id)a4 richLinkID:(id)a5 authors:(id)a6 authorEmailAddresses:(id)a7 objectID:(id)a8 messageID:(id)a9 messageList:(id)a10;
- (MUILinkSuggestion)initWithURL:(id)a3 title:(id)a4 richLinkID:(id)a5 authors:(id)a6 authorEmailAddresses:(id)a7 objectID:(id)a8 messageID:(id)a9 messageList:(id)a10;
- (NSString)messageID;
- (NSString)richLinkID;
- (NSString)title;
- (NSURL)url;
- (id)category;
- (id)description;
@end

@implementation MUILinkSuggestion

+ (id)suggestionWithURL:(id)a3 title:(id)a4 richLinkID:(id)a5 authors:(id)a6 authorEmailAddresses:(id)a7 objectID:(id)a8 messageID:(id)a9 messageList:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = (void *)[objc_alloc((Class)a1) initWithURL:v24 title:v23 richLinkID:v22 authors:v21 authorEmailAddresses:v20 objectID:v19 messageID:v18 messageList:v17];

  return v25;
}

- (MUILinkSuggestion)initWithURL:(id)a3 title:(id)a4 richLinkID:(id)a5 authors:(id)a6 authorEmailAddresses:(id)a7 objectID:(id)a8 messageID:(id)a9 messageList:(id)a10
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)MUILinkSuggestion;
  id v18 = [(MUIResultSuggestion *)&v24 initWithObjectID:a8 messageList:a10 authors:a6 authorEmailAddresses:a7];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_richLinkID, a5);
    objc_storeStrong((id *)&v19->_messageID, a9);
  }

  return v19;
}

- (id)category
{
  return +[MUISearchSuggestionCategory linkCategory];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  url = self->_url;
  title = self->_title;
  richLinkID = self->_richLinkID;
  v8 = [(MUIResultSuggestion *)self authors];
  v9 = [(MUIResultSuggestion *)self authorEmailAddresses];
  v10 = [(MUIResultSuggestion *)self objectID];
  v11 = [(MUIResultSuggestion *)self messageList];
  v12 = [v3 stringWithFormat:@"<%@: %p> url=%@ title=%@ richLinkID=%@  authors=%@ authorEmailAddresses=%@ objectID=%@ messageList=%@", v4, self, url, title, richLinkID, v8, v9, v10, v11];

  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)richLinkID
{
  return self->_richLinkID;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_richLinkID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end