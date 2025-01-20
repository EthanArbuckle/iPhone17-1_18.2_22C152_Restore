@interface NSString(LocalizedCollaboration)
+ (id)ck_localizedAddPeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedCommentedPeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedCreatedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedDeletedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedEditStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedMovedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedRemovePeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedRenamedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_localizedUpdateStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:;
+ (id)ck_suggestionCategoryTitleWithNumberOfSenders:()LocalizedCollaboration documentTitle:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:;
@end

@implementation NSString(LocalizedCollaboration)

+ (id)ck_localizedEditStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_EDITS_TO_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_EDITS_TO_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_EDITS_TO_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_EDITS_TO_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_MADE_EDITS_TO_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_MADE_EDITS_TO_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedUpdateStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_UPDATES_TO_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_UPDATES_TO_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_UPDATES_TO_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MADE_UPDATES_TO_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_MADE_UPDATES_TO_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_MADE_UPDATES_TO_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedCreatedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_CREATED_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_CREATED_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_CREATED_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_CREATED_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_CREATED_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_CREATED_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedDeletedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_DELETED_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_DELETED_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_DELETED_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_DELETED_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_DELETED_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_DELETED_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedRenamedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_RENAMED_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_RENAMED_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_RENAMED_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_RENAMED_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_RENAMED_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_RENAMED_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedMovedStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MOVED_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MOVED_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MOVED_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_MOVED_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_MOVED_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_MOVED_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedAddPeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"ADD_PEOPLE_TO_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"ADD_PEOPLE_TO_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"ADD_PEOPLE_TO_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"ADD_PEOPLE_TO_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"ADD_PEOPLE_TO_N_FOLDERS";
  }
  else {
    v13 = @"ADD_PEOPLE_TO_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedRemovePeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"REMOVE_N_PEOPLE_FROM_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"REMOVE_N_PEOPLE_FROM_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"REMOVE_N_PEOPLE_FROM_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"REMOVE_N_PEOPLE_FROM_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"REMOVE_N_PEOPLE_FROM_N_FOLDERS";
  }
  else {
    v13 = @"REMOVE_N_PEOPLE_FROM_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_localizedCommentedPeopleStringWithNumberOfPeople:()LocalizedCollaboration UTType:numberOfFiles:
{
  id v7 = a4;
  v8 = v7;
  if ((id)*MEMORY[0x1E4F444D0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_LEFT_COMMENTS_ON_N_SPREADSHEETS";
LABEL_11:
    v18 = [v15 localizedStringForKey:v17 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
    v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, a3, a5);

    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F44480] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_LEFT_COMMENTS_ON_N_PRESENTATIONS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F0] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_LEFT_COMMENTS_ON_N_DOCUMENTS";
    goto LABEL_11;
  }
  if ((id)*MEMORY[0x1E4F444F8] == v7)
  {
    v14 = NSString;
    v15 = CKFrameworkBundle();
    v16 = v15;
    v17 = @"N_PEOPLE_LEFT_COMMENTS_ON_N_COLLABORATIONS";
    goto LABEL_11;
  }
  v9 = (void *)*MEMORY[0x1E4F443C8];
  v10 = NSString;
  v11 = CKFrameworkBundle();
  v12 = v11;
  if (v9 == v8) {
    v13 = @"N_PEOPLE_LEFT_COMMENTS_ON_N_FOLDERS";
  }
  else {
    v13 = @"N_PEOPLE_LEFT_COMMENTS_ON_N_COLLABORATIONS";
  }
  v25 = [v11 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
  v19 = objc_msgSend(v10, "localizedStringWithFormat:", v25, a3, a5);

LABEL_12:
  v20 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v21 = [v20 userInterfaceLayoutDirection];

  if (v21 == 1) {
    v22 = @"\u200F";
  }
  else {
    v22 = @"\u200E";
  }
  v23 = [(__CFString *)v22 stringByAppendingString:v19];

  return v23;
}

+ (id)ck_suggestionCategoryTitleWithNumberOfSenders:()LocalizedCollaboration documentTitle:numberOfFiles:numberOfItems:aggregateContentType:aggregateNoticeType:
{
  id v14 = a4;
  id v15 = a7;
  BOOL v16 = a5 == 1 && [v14 length] != 0;
  switch(a8)
  {
    case 0:
      if (v16) {
        goto LABEL_21;
      }
      v17 = a1;
      uint64_t v18 = a3;
      id v19 = v15;
      uint64_t v20 = a5;
      goto LABEL_8;
    case 1:
      if (v16)
      {
        v22 = NSString;
        v23 = CKFrameworkBundle();
        v24 = v23;
        v25 = @"N_PEOPLE_MADE_EDITS_TO_%@";
        goto LABEL_26;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedEditStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 2:
      if (v16)
      {
        v22 = NSString;
        v23 = CKFrameworkBundle();
        v24 = v23;
        v25 = @"N_PEOPLE_LEFT_COMMENTS_ON_%@";
        goto LABEL_26;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedCommentedPeopleStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 3:
      v22 = NSString;
      v24 = CKFrameworkBundle();
      v26 = [v24 localizedStringForKey:@"N_PEOPLE_MENTIONED_YOU" value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
      goto LABEL_27;
    case 4:
      if (v16) {
        goto LABEL_21;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedCreatedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 5:
      if (v16) {
        goto LABEL_21;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedDeletedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 6:
      if (v16) {
        goto LABEL_21;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedRenamedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 7:
      if (v16)
      {
LABEL_21:
        v27 = NSString;
        v24 = CKFrameworkBundle();
        v26 = [v24 localizedStringForKey:@"N_COLLABORATION_UPDATES_TO_%@" value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
        objc_msgSend(v27, "localizedStringWithFormat:", v26, a6, v14);
        goto LABEL_28;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedMovedStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 8:
      if (v16)
      {
        v22 = NSString;
        v23 = CKFrameworkBundle();
        v24 = v23;
        v25 = @"ADD_N_PEOPLE_TO_%@";
        goto LABEL_26;
      }
      uint64_t v21 = objc_msgSend(a1, "ck_localizedAddPeopleStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
      goto LABEL_37;
    case 9:
      if (v16)
      {
        v22 = NSString;
        v23 = CKFrameworkBundle();
        v24 = v23;
        v25 = @"REMOVE_N_PEOPLE_FROM_%@";
LABEL_26:
        v26 = [v23 localizedStringForKey:v25 value:&stru_1EDE4CA38 table:@"ChatKitFormats-Collaboration"];
        id v34 = v14;
LABEL_27:
        objc_msgSend(v22, "localizedStringWithFormat:", v26, a3, v34);
        v28 = LABEL_28:;

        v29 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v30 = [v29 userInterfaceLayoutDirection];

        if (v30 == 1) {
          v31 = @"\u200F";
        }
        else {
          v31 = @"\u200E";
        }
        v32 = [(__CFString *)v31 stringByAppendingString:v28];
      }
      else
      {
        uint64_t v21 = objc_msgSend(a1, "ck_localizedRemovePeopleStringWithNumberOfPeople:UTType:numberOfFiles:", a3, v15, a5);
LABEL_37:
        v32 = (void *)v21;
      }

      return v32;
    default:
      v17 = a1;
      uint64_t v18 = a3;
      id v19 = v15;
      uint64_t v20 = a6;
LABEL_8:
      uint64_t v21 = objc_msgSend(v17, "ck_localizedUpdateStringWithNumberOfPeople:UTType:numberOfFiles:", v18, v19, v20);
      goto LABEL_37;
  }
}

@end