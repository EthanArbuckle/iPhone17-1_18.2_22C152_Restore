@interface MUILocationSuggestion
+ (id)suggestionWithAddress:(id)a3 date:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6 objectID:(id)a7 messageList:(id)a8;
- (MUILocationSuggestion)initWithAddress:(id)a3 date:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6 objectID:(id)a7 messageList:(id)a8;
- (NSDate)date;
- (NSString)address;
- (id)category;
- (id)description;
@end

@implementation MUILocationSuggestion

+ (id)suggestionWithAddress:(id)a3 date:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6 objectID:(id)a7 messageList:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithAddress:v19 date:v18 authors:v17 authorEmailAddresses:v16 objectID:v15 messageList:v14];

  return v20;
}

- (MUILocationSuggestion)initWithAddress:(id)a3 date:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6 objectID:(id)a7 messageList:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MUILocationSuggestion;
  id v17 = [(MUIResultSuggestion *)&v20 initWithObjectID:a7 messageList:a8 authors:a5 authorEmailAddresses:a6];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_address, a3);
    objc_storeStrong((id *)&v18->_date, a4);
  }

  return v18;
}

- (id)category
{
  return +[MUISearchSuggestionCategory locationCategory];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  address = self->_address;
  date = self->_date;
  v7 = [(MUIResultSuggestion *)self authors];
  v8 = [(MUIResultSuggestion *)self authorEmailAddresses];
  v9 = [(MUIResultSuggestion *)self objectID];
  v10 = [(MUIResultSuggestion *)self messageList];
  v11 = [v3 stringWithFormat:@"<%@: %p> address=%@ date=%@ authors=%@ authorEmailAddresses=%@ objectID=%@ messageList=%@", v4, self, address, date, v7, v8, v9, v10];

  return v11;
}

- (NSString)address
{
  return self->_address;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end