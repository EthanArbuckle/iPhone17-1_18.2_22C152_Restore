@interface CKReviewLargeConversationsTableViewCell
+ (CGSize)leftHandSideViewSize;
+ (double)requestedHeight;
- (CNAvatarView)avatarView;
- (IMChat)chat;
- (id)leftHandSideView;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
- (void)setChat:(id)a3;
- (void)setModelObject:(id)a3;
@end

@implementation CKReviewLargeConversationsTableViewCell

+ (double)requestedHeight
{
  return 58.0;
}

+ (CGSize)leftHandSideViewSize
{
  double v2 = 45.0;
  double v3 = 45.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setModelObject:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"chat"];
    [(CKReviewLargeConversationsTableViewCell *)self setChat:v5];

    v6 = [v7 objectForKeyedSubscript:@"size"];
    -[CKAbstractReviewTableViewCell setSize:](self, "setSize:", [v6 unsignedLongLongValue]);
  }
  else
  {
    [(CKReviewLargeConversationsTableViewCell *)self setChat:0];
    [(CKAbstractReviewTableViewCell *)self setSize:0];
  }
}

- (id)leftHandSideView
{
  double v3 = [(CKReviewLargeConversationsTableViewCell *)self avatarView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1BB38]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKReviewLargeConversationsTableViewCell *)self setAvatarView:v5];
  }

  return [(CKReviewLargeConversationsTableViewCell *)self avatarView];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKReviewLargeConversationsTableViewCell;
  [(CKAbstractReviewTableViewCell *)&v3 prepareForReuse];
  [(CKReviewLargeConversationsTableViewCell *)self setChat:0];
}

- (void)setChat:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_chat, a3);
  if (!v5)
  {
    [(CKAbstractReviewTableViewCell *)self setMainText:0];
    v12 = [(CKReviewLargeConversationsTableViewCell *)self avatarView];
    [v12 setContacts:MEMORY[0x1E4F1CBF0]];

    [(CKAbstractReviewTableViewCell *)self setSubheadingText:0];
    goto LABEL_24;
  }
  v6 = [v5 participants];
  v34 = [v5 lastMessage];
  id v7 = [v5 displayName];
  if (v7
    && ([v5 displayName],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:&stru_1EDE4CA38],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    v10 = [v5 displayName];
    [(CKAbstractReviewTableViewCell *)self setMainText:v10];
  }
  else
  {
    if ([v6 count] != 1)
    {
      if ((unint64_t)[v6 count] >= 2)
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke;
        v40[3] = &unk_1E5620C68;
        id v41 = v5;
        v13 = objc_msgSend(v6, "__imArrayByApplyingBlock:", v40);
        v14 = [MEMORY[0x1E4F28E78] string];
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x2020000000;
        uint64_t v39 = 0;
        uint64_t v39 = [v13 count] - 1;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke_2;
        v35[3] = &unk_1E5620C90;
        id v15 = v14;
        id v36 = v15;
        v37 = v38;
        [v13 enumerateObjectsUsingBlock:v35];
        v16 = (void *)[v15 copy];
        [(CKAbstractReviewTableViewCell *)self setMainText:v16];

        _Block_object_dispose(v38, 8);
      }
      goto LABEL_11;
    }
    v10 = [v6 objectAtIndexedSubscript:0];
    v11 = [v10 displayNameForChat:v5];
    [(CKAbstractReviewTableViewCell *)self setMainText:v11];
  }
LABEL_11:
  id v17 = v6;
  v18 = v17;
  if ((unint64_t)[v17 count] >= 2)
  {
    v18 = v17;
    if (v34)
    {
      v18 = v17;
      if (([v34 isFromMe] & 1) == 0)
      {
        v19 = [v34 sender];
        v20 = [MEMORY[0x1E4F1C978] arrayWithObject:v19];
        v42[0] = v19;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
        v22 = [v17 arrayByExcludingObjectsInArray:v21];
        v18 = [v20 arrayByAddingObjectsFromArray:v22];
      }
    }
  }
  v23 = objc_msgSend(v18, "__imArrayByApplyingBlock:", &__block_literal_global_0);
  v24 = [(CKReviewLargeConversationsTableViewCell *)self avatarView];
  [v24 setContacts:v23];

  v25 = [v34 time];
  if (v25)
  {
    v26 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    if ([v26 isDateInToday:v25])
    {
      v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"TODAY" value:&stru_1EDE4CA38 table:@"General"];
    }
    else if ([v26 isDateInYesterday:v25])
    {
      v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v28 = [v29 localizedStringForKey:@"YESTERDAY" value:&stru_1EDE4CA38 table:@"General"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v25 dateStyle:2 timeStyle:0];
    }
    v30 = NSString;
    v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"LAST_UPDATED_FMT" value:&stru_1EDE4CA38 table:@"General"];
    v33 = objc_msgSend(v30, "stringWithFormat:", v32, v28);
    [(CKAbstractReviewTableViewCell *)self setSubheadingText:v33];
  }
  else
  {
    [(CKAbstractReviewTableViewCell *)self setSubheadingText:0];
  }

LABEL_24:
  [(CKReviewLargeConversationsTableViewCell *)self setNeedsLayout];
}

uint64_t __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayNameForChat:*(void *)(a1 + 32)];
}

void __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = v7;
    if (v6 == a3) {
      char v9 = @"PARTICIPANT_ADDRESS_FINAL_ITEM";
    }
    else {
      char v9 = @"PARTICIPANT_ADDRESS_NON_FINAL_ITEM";
    }
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = v7;
    char v9 = @"PARTICIPANT_ADDRESS_FIRST_ITEM";
  }
  v10 = [v7 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:@"General"];
  objc_msgSend(v5, "appendFormat:", v10, v11);
}

id __51__CKReviewLargeConversationsTableViewCell_setChat___block_invoke_3(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  if (v3) {
    goto LABEL_11;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  id v4 = [v2 ID];
  if ([v4 _appearsToBeEmail])
  {
    id v5 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v4];
    v12[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v3 setEmailAddresses:v6];
  }
  else
  {
    if (![v4 _appearsToBePhoneNumber]) {
      goto LABEL_7;
    }
    id v7 = (void *)MEMORY[0x1E4F1BA20];
    v8 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
    id v5 = [v7 labeledValueWithLabel:0 value:v8];

    id v11 = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [v3 setPhoneNumbers:v6];
  }

LABEL_7:
  if ([v2 isBusiness])
  {
    char v9 = [v2 brand];

    if (v9) {
      _CKSetBusinessInfoForMutableContact(v3, v2, 0);
    }
  }

LABEL_11:

  return v3;
}

- (IMChat)chat
{
  return self->_chat;
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);

  objc_storeStrong((id *)&self->_chat, 0);
}

@end