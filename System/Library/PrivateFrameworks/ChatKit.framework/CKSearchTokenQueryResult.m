@interface CKSearchTokenQueryResult
- (BOOL)hasFilterOption:(unint64_t)a3;
- (CKSearchTokenFilter)associatedStagedFilter;
- (CKSearchTokenQueryResult)initWithContentType:(unint64_t)a3 filterOptions:(unint64_t)a4 conversation:(id)a5 itemIdentifier:(id)a6 tokenAddresses:(id)a7;
- (NSArray)tokenAddresses;
- (NSString)itemIdentifier;
- (UISearchToken)searchToken;
- (id)attributedSuggestionTextForSearchText:(id)a3 font:(id)a4;
- (id)image;
- (id)tokenText;
- (unint64_t)contentType;
- (unint64_t)filterOptions;
- (void)addFilterOption:(unint64_t)a3;
- (void)setAssociatedStagedFilter:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setFilterOptions:(unint64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setSearchToken:(id)a3;
- (void)setTokenAddresses:(id)a3;
@end

@implementation CKSearchTokenQueryResult

- (CKSearchTokenQueryResult)initWithContentType:(unint64_t)a3 filterOptions:(unint64_t)a4 conversation:(id)a5 itemIdentifier:(id)a6 tokenAddresses:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CKSearchTokenQueryResult;
  v15 = [(CKSearchTokenQueryResult *)&v22 init];
  v16 = v15;
  if (v15)
  {
    [(CKSearchTokenQueryResult *)v15 setContentType:a3];
    [(CKSearchTokenQueryResult *)v16 setItemIdentifier:v13];
    [(CKSearchTokenQueryResult *)v16 setTokenAddresses:v14];
    [(CKSearchTokenQueryResult *)v16 setFilterOptions:a4];
    if (v12) {
      [(CKSpotlightQueryResult *)v16 setConversation:v12];
    }
    v17 = NSString;
    v18 = [(CKSearchTokenQueryResult *)v16 tokenText];
    v19 = [NSString stringGUID];
    v20 = [v17 stringWithFormat:@"%@-%@", v18, v19];

    [(CKSpotlightQueryResult *)v16 setIdentifier:v20];
  }

  return v16;
}

- (UISearchToken)searchToken
{
  searchToken = self->_searchToken;
  if (!searchToken)
  {
    v4 = [[CKSearchTokenFilter alloc] initWithContentType:self->_contentType filterOptions:self->_filterOptions itemIdentifier:self->_itemIdentifier tokenAddresses:self->_tokenAddresses];
    v5 = [(CKSpotlightQueryResult *)self conversation];
    [(CKSearchTokenFilter *)v4 setConversation:v5];

    v6 = (void *)MEMORY[0x1E4F42DC8];
    v7 = [(CKSearchTokenQueryResult *)self image];
    v8 = [(CKSearchTokenQueryResult *)self tokenText];
    v9 = [v6 tokenWithIcon:v7 text:v8];

    [(UISearchToken *)v9 setRepresentedObject:v4];
    v10 = self->_searchToken;
    self->_searchToken = v9;

    searchToken = self->_searchToken;
  }

  return searchToken;
}

- (id)image
{
  v2 = @"link";
  switch(self->_contentType)
  {
    case 0uLL:
      uint64_t v4 = [(CKSpotlightQueryResult *)self conversation];
      if (v4
        && (v5 = (void *)v4,
            [(CKSpotlightQueryResult *)self conversation],
            v6 = objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 isGroupConversation],
            v6,
            v5,
            (v7 & 1) != 0))
      {
        v2 = @"person.2.circle";
      }
      else
      {
        v2 = @"person.crop.circle";
      }
      break;
    case 2uLL:
      break;
    case 3uLL:
      v2 = @"photo";
      break;
    case 4uLL:
      v2 = @"mappin.and.ellipse";
      break;
    case 5uLL:
      v2 = @"wallet.pass";
      break;
    case 6uLL:
      v2 = @"doc";
      break;
    case 8uLL:
      v2 = @"calendar";
      break;
    default:
      v2 = @"message";
      break;
  }
  v8 = [MEMORY[0x1E4F42A80] systemImageNamed:v2];

  return v8;
}

- (id)tokenText
{
  v3 = [(CKSpotlightQueryResult *)self conversation];

  if (v3)
  {
    uint64_t v4 = [(CKSpotlightQueryResult *)self conversation];
    char v5 = [v4 hasDisplayName];
    v6 = [(CKSpotlightQueryResult *)self conversation];
    char v7 = v6;
    if (v5) {
      [v6 displayName];
    }
    else {
    v8 = [v6 name];
    }
  }
  else
  {
    v8 = [(CKSearchTokenQueryResult *)self itemIdentifier];
  }
  if ([(CKSearchTokenQueryResult *)self hasFilterOption:2])
  {
    v9 = NSString;
    v10 = CKFrameworkBundle();
    v11 = [v10 localizedStringForKey:@"FROM_%@" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);

    id v13 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v14 = [v13 userInterfaceLayoutDirection];

    if (v14 == 1) {
      v15 = @"\u200F";
    }
    else {
      v15 = @"\u200E";
    }
    uint64_t v16 = [(__CFString *)v15 stringByAppendingString:v12];

    v8 = (void *)v16;
  }

  return v8;
}

- (id)attributedSuggestionTextForSearchText:(id)a3 font:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(CKSpotlightQueryResult *)self conversation];

  if (v8)
  {
    v9 = [(CKSpotlightQueryResult *)self conversation];
    char v10 = [v9 hasDisplayName];
    v11 = [(CKSpotlightQueryResult *)self conversation];
    id v12 = v11;
    if (v10) {
      [v11 displayName];
    }
    else {
    id v13 = [v11 searchDisplayName];
    }
  }
  else
  {
    id v13 = [(CKSearchTokenQueryResult *)self itemIdentifier];
  }
  uint64_t v14 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v15 = [MEMORY[0x1E4F428B8] labelColor];
  if (v7) {
    +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:v6 resultText:v13 primaryTextColor:v14 primaryFont:v7 annotatedTextColor:v15 annotatedFont:v7];
  }
  else {
  uint64_t v16 = +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:v6 resultText:v13 primaryTextColor:v14 annotatedTextColor:v15];
  }

  if ([(CKSearchTokenQueryResult *)self contentType]) {
    goto LABEL_11;
  }
  v19 = [(CKSpotlightQueryResult *)self conversation];

  if (!v19) {
    goto LABEL_11;
  }
  if ([(CKSearchTokenQueryResult *)self hasFilterOption:2])
  {
    v20 = CKFrameworkBundle();
    v21 = v20;
    objc_super v22 = @"MESSAGES_FROM_%@";
  }
  else
  {
    v23 = [(CKSpotlightQueryResult *)self conversation];
    int v24 = [v23 isGroupConversation];

    v20 = CKFrameworkBundle();
    v21 = v20;
    objc_super v22 = v24 ? @"MESSAGES_IN_%@" : @"MESSAGES_WITH_%@";
  }
  v25 = [v20 localizedStringForKey:v22 value:&stru_1EDE4CA38 table:@"ChatKit"];

  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v30 = *MEMORY[0x1E4FB0700];
    v27 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v31[0] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v29 = (void *)[v26 initWithString:v25 attributes:v28];

    objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v29, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    id v17 = v16;
  }

  return v17;
}

- (BOOL)hasFilterOption:(unint64_t)a3
{
  return (a3 & ~[(CKSearchTokenQueryResult *)self filterOptions]) == 0;
}

- (void)addFilterOption:(unint64_t)a3
{
  unint64_t v4 = [(CKSearchTokenQueryResult *)self filterOptions] | a3;

  [(CKSearchTokenQueryResult *)self setFilterOptions:v4];
}

- (void)setSearchToken:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSArray)tokenAddresses
{
  return self->_tokenAddresses;
}

- (void)setTokenAddresses:(id)a3
{
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (CKSearchTokenFilter)associatedStagedFilter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedStagedFilter);

  return (CKSearchTokenFilter *)WeakRetained;
}

- (void)setAssociatedStagedFilter:(id)a3
{
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedStagedFilter);
  objc_storeStrong((id *)&self->_tokenAddresses, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_searchToken, 0);
}

@end