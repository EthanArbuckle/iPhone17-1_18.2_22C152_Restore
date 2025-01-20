@interface CNContactAddFavoriteAction
- (BOOL)canPerformAction;
- (CNContactAddFavoriteAction)initWithContact:(id)a3 propertyItems:(id)a4 favorites:(id)a5;
- (CNFavorites)favorites;
- (CNUIFavoritesEntryPicker)favoritesEntryPicker;
- (id)menuProviderForContextMenuInteraction:(id)a3;
- (void)_saveFavorite:(id)a3;
- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4;
- (void)setFavoritesEntryPicker:(id)a3;
@end

@implementation CNContactAddFavoriteAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);

  objc_storeStrong((id *)&self->_favoritesEntryPicker, 0);
}

- (CNFavorites)favorites
{
  return self->_favorites;
}

- (void)setFavoritesEntryPicker:(id)a3
{
}

- (CNUIFavoritesEntryPicker)favoritesEntryPicker
{
  return self->_favoritesEntryPicker;
}

- (void)_saveFavorite:(id)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49 = self;
  v5 = [(CNContactAddFavoriteAction *)self favorites];
  v51 = [v4 contactProperty];
  v50 = [v51 contact];
  v6 = [v4 contactProperty];
  v7 = [v6 key];
  v8 = [v4 contactProperty];
  v9 = [v8 identifier];
  v10 = [v4 actionType];
  v11 = [v4 bundleIdentifier];
  v12 = [v5 entriesForContact:v50 propertyKey:v7 labeledValueIdentifier:v9 actionType:v10 bundleIdentifier:v11];
  uint64_t v13 = [v12 count];

  v14 = v5;
  if (v13) {
    goto LABEL_30;
  }
  [v5 addEntry:v4];
  [v5 save];
  uint64_t v15 = [v4 actionType];
  uint64_t v16 = *MEMORY[0x1E4F1AD20];
  uint64_t v17 = v15 | *MEMORY[0x1E4F1AD20];
  BOOL v18 = v17 != 0;
  if (v17)
  {
    v6 = [v4 actionType];
    if (([v6 isEqual:v16] & 1) == 0)
    {

      goto LABEL_13;
    }
  }
  uint64_t v19 = [v4 bundleIdentifier];
  uint64_t v20 = *MEMORY[0x1E4F1AD10];
  if (!(v19 | *MEMORY[0x1E4F1AD10]))
  {
    if (v18)
    {
    }
    goto LABEL_12;
  }
  v21 = (void *)v19;
  v22 = [v4 bundleIdentifier];
  int v23 = [v22 isEqual:v20];

  if (!v18)
  {
    if (v23) {
      goto LABEL_12;
    }
LABEL_13:
    uint64_t v25 = [v4 actionType];
    uint64_t v26 = *MEMORY[0x1E4F1AD78];
    v27 = (uint64_t *)MEMORY[0x1E4F1AD00];
    uint64_t v28 = v25 | *MEMORY[0x1E4F1AD78];
    BOOL v29 = v28 != 0;
    if (v28
      && ([v4 actionType],
          v6 = objc_claimAutoreleasedReturnValue(),
          ([v6 isEqual:v26] & 1) == 0))
    {
    }
    else
    {
      uint64_t v30 = [v4 bundleIdentifier];
      uint64_t v31 = *v27;
      if (!(v30 | *v27))
      {
        if (v29)
        {
        }
        goto LABEL_23;
      }
      v32 = (void *)v30;
      v33 = [v4 bundleIdentifier];
      int v34 = [v33 isEqual:v31];

      if (v29)
      {

        if ((v34 & 1) == 0) {
          goto LABEL_31;
        }
LABEL_23:
        v24 = (void *)CNUIContactActionDestinationTypeFaceTime;
        goto LABEL_24;
      }
      if (v34) {
        goto LABEL_23;
      }
    }
LABEL_31:
    uint64_t v42 = [v4 actionType];
    BOOL v43 = (v42 | v16) != 0;
    if (v42 | v16)
    {
      v6 = [v4 actionType];
      if (([v6 isEqual:v16] & 1) == 0)
      {

        id v35 = 0;
        goto LABEL_25;
      }
    }
    uint64_t v44 = [v4 bundleIdentifier];
    uint64_t v45 = *v27;
    if (!(v44 | *v27))
    {
      v36 = v49;
      if (v42 | v16)
      {
      }
      goto LABEL_41;
    }
    v46 = (void *)v44;
    v47 = [v4 bundleIdentifier];
    int v48 = [v47 isEqual:v45];

    v36 = v49;
    if (v43)
    {

      if ((v48 & 1) == 0)
      {
LABEL_38:
        id v35 = 0;
        goto LABEL_26;
      }
    }
    else if (!v48)
    {
      goto LABEL_38;
    }
LABEL_41:
    id v35 = (id)CNUIContactActionDestinationTypeFaceTimeAudio;
    goto LABEL_26;
  }

  if ((v23 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_12:
  v24 = (void *)CNUIContactActionDestinationTypePhoneNumber;
LABEL_24:
  id v35 = v24;
LABEL_25:
  v36 = v49;
LABEL_26:
  v37 = +[CNUIDataCollector sharedCollector];
  v38 = v37;
  uint64_t v39 = CNUIContactActionTypeAddToFavorites;
  if (v35)
  {
    uint64_t v52 = CNUIContactActionDestinationType;
    v53[0] = v35;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    [v38 logContactActionType:v39 attributes:v40];
  }
  else
  {
    [v37 logContactActionType:CNUIContactActionTypeAddToFavorites attributes:0];
  }

  v41 = [(CNContactAction *)v36 delegate];
  [v41 actionDidFinish:v36];

LABEL_30:
}

- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4
{
  id v5 = a4;
  [(CNContactAddFavoriteAction *)self setFavoritesEntryPicker:0];
  [(CNContactAddFavoriteAction *)self _saveFavorite:v5];
}

- (id)menuProviderForContextMenuInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [CNUIFavoritesEntryPicker alloc];
  v6 = [(CNContactAction *)self contact];
  v7 = [(CNUIFavoritesEntryPicker *)v5 initWithContact:v6];
  [(CNContactAddFavoriteAction *)self setFavoritesEntryPicker:v7];

  v8 = [(CNContactAddFavoriteAction *)self favoritesEntryPicker];
  [v8 setDelegate:self];

  v9 = [(CNContactAddFavoriteAction *)self favoritesEntryPicker];
  v10 = [v9 menuProviderForContextMenuInteraction:v4];

  return v10;
}

- (BOOL)canPerformAction
{
  return 1;
}

- (CNContactAddFavoriteAction)initWithContact:(id)a3 propertyItems:(id)a4 favorites:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CNContactAddFavoriteAction;
  v10 = [(CNPropertyAction *)&v13 initWithContact:a3 propertyItems:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_favorites, a5);
  }

  return v11;
}

@end