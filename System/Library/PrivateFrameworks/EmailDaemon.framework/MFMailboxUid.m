@interface MFMailboxUid
+ (id)iconFromBundle:(id)a3 forType:(int64_t)a4;
+ (id)shorcutIconNameForMailboxType:(int64_t)a3;
- (BOOL)mv_isEditable;
- (id)foundInDescriptionIncludingAccount:(BOOL)a3;
- (id)iconFromBundle:(id)a3;
- (id)tinyDisplayIconWithColor:(id)a3;
- (int)level;
@end

@implementation MFMailboxUid

+ (id)shorcutIconNameForMailboxType:(int64_t)a3
{
  v4 = (void *)qword_10016B868;
  if (!qword_10016B868)
  {
    v11[0] = &off_1001460C8;
    v11[1] = &off_1001460E0;
    v12[0] = MFImageGlyphGenericMailbox;
    v12[1] = MFImageGlyphTrashMailbox;
    v11[2] = &off_1001460F8;
    v11[3] = &off_100146110;
    v12[2] = MFImageGlyphSentMailbox;
    v12[3] = MFImageGlyphDraftMailbox;
    v11[4] = &off_100146128;
    v11[5] = &off_100146140;
    v12[4] = MFImageGlyphOutboxMailbox;
    v12[5] = MFImageGlyphInboxMailbox;
    v11[6] = &off_100146158;
    v11[7] = &off_100146170;
    v12[6] = MFImageGlyphArchiveMailbox;
    v12[7] = MFImageGlyphJunkMailbox;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:8];
    v6 = (void *)qword_10016B868;
    qword_10016B868 = v5;

    v4 = (void *)qword_10016B868;
  }
  if ((unint64_t)(a3 - 8) >= 0xFFFFFFFFFFFFFFF9) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = 0;
  }
  v8 = +[NSNumber numberWithInteger:v7];
  v9 = [v4 objectForKeyedSubscript:v8];

  return v9;
}

+ (id)iconFromBundle:(id)a3 forType:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)qword_10016B870;
  if (!qword_10016B870)
  {
    v14[0] = &off_1001460C8;
    v14[1] = &off_1001460E0;
    v15[0] = MFImageGlyphGenericMailbox;
    v15[1] = MFImageGlyphTrashMailbox;
    v14[2] = &off_1001460F8;
    v14[3] = &off_100146110;
    v15[2] = MFImageGlyphSentMailbox;
    v15[3] = MFImageGlyphDraftMailbox;
    v14[4] = &off_100146128;
    v14[5] = &off_100146140;
    v15[4] = MFImageGlyphOutboxMailbox;
    v15[5] = MFImageGlyphInboxMailbox;
    v14[6] = &off_100146158;
    v14[7] = &off_100146170;
    v15[6] = MFImageGlyphArchiveMailbox;
    v15[7] = MFImageGlyphJunkMailbox;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];
    v8 = (void *)qword_10016B870;
    qword_10016B870 = v7;

    v6 = (void *)qword_10016B870;
  }
  if ((unint64_t)(a4 - 8) >= 0xFFFFFFFFFFFFFFF9) {
    int64_t v9 = a4;
  }
  else {
    int64_t v9 = 0;
  }
  v10 = +[NSNumber numberWithInteger:v9];
  v11 = [v6 objectForKeyedSubscript:v10];
  v12 = +[UIImage mf_systemImageNamed:v11 forView:7];

  return v12;
}

- (id)iconFromBundle:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "iconFromBundle:forType:", v4, -[MFMailboxUid mailboxType](self, "mailboxType"));

  return v5;
}

- (int)level
{
  uint64_t v2 = [(MFMailboxUid *)self parent];
  if (!v2) {
    return 0;
  }
  v3 = (void *)v2;
  int v4 = 0;
  do
  {
    if ([v3 type] == (id)8) {
      break;
    }
    uint64_t v5 = [v3 parent];
    ++v4;

    v3 = (void *)v5;
  }
  while (v5);

  return v4;
}

- (id)foundInDescriptionIncludingAccount:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFMailboxUid *)self displayNameUsingSpecialNames];
  v6 = +[NSBundle mainBundle];
  uint64_t v7 = [v6 localizedStringForKey:@"MAILBOX_SUFFIX" value:&stru_10013ED08 table:@"Main"];
  if ([v5 hasSuffix:v7])
  {
    int v8 = 1;
  }
  else
  {
    int64_t v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"BOX_SUFFIX" value:&stru_10013ED08 table:@"Main"];
    if ([v5 hasSuffix:v10])
    {
      int v8 = 1;
    }
    else
    {
      v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"FOLDER_SUFFIX" value:&stru_10013ED08 table:@"Main"];
      int v8 = [v5 hasSuffix:v12];
    }
  }

  if (!v3) {
    goto LABEL_12;
  }
  v13 = (char *)[(MFMailboxUid *)self type];
  if ((unint64_t)(v13 - 2) >= 4 && v13 != (char *)7) {
    goto LABEL_12;
  }
  v14 = [(MFMailboxUid *)self account];
  v15 = [v14 displayName];

  if (!v15
    || (sub_1000340E0(1, v8),
        v16 = objc_claimAutoreleasedReturnValue(),
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v15, v5),
        v17 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v17))
  {
LABEL_12:
    v18 = sub_1000340E0(0, v8);
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v5);
  }

  return v17;
}

- (id)tinyDisplayIconWithColor:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailboxUid *)self type];
  v6 = (id *)&MFImageGlyphSentMailbox;
  if (v5 != (id)4) {
    v6 = (id *)&MFImageGlyphGenericMailbox;
  }
  id v7 = *v6;
  int v8 = +[UIImage mf_systemImageNamed:v7 forView:19];
  int64_t v9 = v8;
  if (v4)
  {
    uint64_t v10 = [v8 _flatImageWithColor:v4];

    int64_t v9 = (void *)v10;
  }

  return v9;
}

- (BOOL)mv_isEditable
{
  return [(MFMailboxUid *)self type] == 0;
}

@end