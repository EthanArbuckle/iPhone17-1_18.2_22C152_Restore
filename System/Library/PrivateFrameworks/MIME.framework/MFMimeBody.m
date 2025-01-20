@interface MFMimeBody
+ (id)copyNewMimeBoundary;
+ (id)versionString;
- (BOOL)hasEncryptedDescendantPart;
- (BOOL)isEncrypted;
- (BOOL)isHTML;
- (BOOL)isRich;
- (MFMimeBody)init;
- (MFMimePart)topLevelPart;
- (NSArray)signers;
- (NSString)mimeSubtype;
- (NSString)mimeType;
- (id)attachmentURLs;
- (id)attachments;
- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5 isComplete:(BOOL *)a6;
- (id)partWithNumber:(id)a3;
- (id)preferredBodyPart;
- (id)textHtmlPart;
- (int64_t)numberOfAlternatives;
- (int64_t)preferredAlternative;
- (unint64_t)totalTextSize;
- (unsigned)numberOfAttachmentsSigned:(BOOL *)a3 encrypted:(BOOL *)a4;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setPreferredAlternative:(int64_t)a3;
- (void)setSigners:(id)a3;
- (void)setTopLevelPart:(id)a3;
@end

@implementation MFMimeBody

- (void)setTopLevelPart:(id)a3
{
  if (self->_topLevelPart != a3)
  {
    objc_storeStrong((id *)&self->_topLevelPart, a3);
    *((_WORD *)self + 17) = -1;
  }
  MEMORY[0x1F41817F8]();
}

- (MFMimeBody)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMimeBody;
  result = [(MFMimeBody *)&v3 init];
  if (result) {
    *((_WORD *)result + 16) = -1;
  }
  return result;
}

- (id)attachments
{
  v2 = [(MFMimeBody *)self topLevelPart];
  [v2 decodeIfNecessary];
  objc_super v3 = [v2 attachments];

  return v3;
}

- (MFMimePart)topLevelPart
{
  return self->_topLevelPart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signers, 0);
  objc_storeStrong((id *)&self->_topLevelPart, 0);
}

- (id)partWithNumber:(id)a3
{
  id v4 = a3;
  v5 = [(MFMimeBody *)self topLevelPart];
  v6 = [v5 childPartWithNumber:v4];

  return v6;
}

+ (id)versionString
{
  if (versionString_onceToken != -1) {
    dispatch_once(&versionString_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)versionString_mime_version;
  return v2;
}

void __27__MFMimeBody_versionString__block_invoke()
{
  v0 = (void *)MEMORY[0x1B3E87F20]();
  uint64_t v1 = [[NSString alloc] initWithFormat:@"1.0 (%@)", @"1.0"];
  v2 = (void *)versionString_mime_version;
  versionString_mime_version = v1;
}

+ (id)copyNewMimeBoundary
{
  id v2 = [NSString alloc];
  objc_super v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  v5 = (void *)[v2 initWithFormat:@"Apple-Mail-%@", v4];

  return v5;
}

- (NSString)mimeType
{
  id v2 = [(MFMimeBody *)self preferredBodyPart];
  objc_super v3 = [v2 type];

  return (NSString *)v3;
}

- (NSString)mimeSubtype
{
  id v2 = [(MFMimeBody *)self preferredBodyPart];
  objc_super v3 = [v2 subtype];

  return (NSString *)v3;
}

- (BOOL)hasEncryptedDescendantPart
{
  int64_t encryptedDescendantState = self->_encryptedDescendantState;
  if (!encryptedDescendantState)
  {
    id v4 = self;
    v5 = [(MFMimeBody *)v4 topLevelPart];
    [v5 decodeIfNecessary];
    uint64_t v6 = [v5 decryptedMessageBodyIsEncrypted:0 isSigned:0];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v4;
    }
    id v9 = v8;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v10 = [v9 topLevelPart];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v22 = __computeHasEncryptedDescendant_block_invoke;
    v23 = &unk_1E5F89BC0;
    id v11 = v5;
    id v24 = v11;
    v25 = &v26;
    id v12 = v10;
    v13 = v21;
    char v30 = 0;
    id v14 = v12;
    v15 = v14;
    if (v14)
    {
      for (i = v14; ; i = (void *)v17)
      {
        v22((uint64_t)v13, i, &v30);
        if (v30) {
          break;
        }
        uint64_t v17 = [i firstChildPart];
        if (!v17)
        {
          while (1)
          {
            uint64_t v17 = [i nextSiblingPart];
            if (v17) {
              break;
            }
            uint64_t v18 = [i parentPart];

            i = (void *)v18;
            if (!v18) {
              goto LABEL_13;
            }
          }
        }
      }
LABEL_13:
    }
    int v19 = *((unsigned __int8 *)v27 + 24);

    _Block_object_dispose(&v26, 8);
    int64_t encryptedDescendantState = 1;
    if (!v19) {
      int64_t encryptedDescendantState = 2;
    }
    self->_int64_t encryptedDescendantState = encryptedDescendantState;
  }
  return encryptedDescendantState == 1;
}

- (unsigned)numberOfAttachmentsSigned:(BOOL *)a3 encrypted:(BOOL *)a4
{
  unsigned int v10 = 0;
  uint64_t v6 = [(MFMimeBody *)self topLevelPart];
  v7 = v6;
  if (v6)
  {
    [v6 decodeIfNecessary];
    [v7 getNumberOfAttachments:&v10 isSigned:a3 isEncrypted:a4];
    unsigned int v8 = v10;
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (id)attachmentURLs
{
  id v2 = [(MFMimeBody *)self topLevelPart];
  [v2 decodeIfNecessary];
  objc_super v3 = [v2 attachmentURLs];

  return v3;
}

- (BOOL)isHTML
{
  objc_super v3 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v4 = [v3 isHTML];
  }
  else
  {
    v5 = [(MFMimeBody *)self preferredBodyPart];
    char v4 = [v5 isHTML];
  }
  return v4;
}

- (BOOL)isRich
{
  objc_super v3 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v4 = [v3 isRich];
  }
  else
  {
    v5 = [(MFMimePart *)self->_topLevelPart startPart];
    char v4 = [v5 isRich];
  }
  return v4;
}

- (id)contentToOffset:(unint64_t)a3 resultOffset:(unint64_t *)a4 asHTML:(BOOL)a5 isComplete:(BOOL *)a6
{
  BOOL v7 = a5;
  id v11 = [(MFMimePart *)self->_topLevelPart startPart];
  id v12 = [v11 contentToOffset:a3 resultOffset:a4 downloadIfNecessary:1 asHTML:v7 isComplete:a6];

  if (!v12)
  {
    uint64_t v13 = [(MFMimeBody *)self numberOfAlternatives];
    int64_t v14 = [(MFMimeBody *)self preferredAlternative];
    if (v13 >= 1 && v14)
    {
      if (v14 == -1) {
        int64_t v14 = [(MFMimeBody *)self numberOfAlternatives] - 1;
      }
      [(MFMimeBody *)self setPreferredAlternative:v14 - 1];
      uint64_t v15 = [(MFMimeBody *)self contentToOffset:a3 resultOffset:a4 asHTML:v7 isComplete:a6];
      goto LABEL_9;
    }
    v16 = [(MFMessageBody *)self rawData];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      uint64_t v15 = [NSNumber numberWithInt:4294967254];
LABEL_9:
      id v12 = (void *)v15;
      goto LABEL_10;
    }
    id v12 = 0;
  }
LABEL_10:
  return v12;
}

- (unint64_t)totalTextSize
{
  return [(MFMimePart *)self->_topLevelPart totalTextSize];
}

- (int64_t)numberOfAlternatives
{
  objc_super v3 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 numberOfAlternatives];
  }
  else
  {
    int v5 = *((__int16 *)self + 17);
    if (v5 < 0)
    {
      topLevelPart = self->_topLevelPart;
      if (topLevelPart)
      {
        BOOL v7 = [(MFMimePart *)topLevelPart startPart];
        *((_WORD *)self + 17) = [v7 numberOfAlternatives];

        LOWORD(v5) = *((_WORD *)self + 17);
      }
    }
    int64_t v4 = (__int16)v5;
  }

  return v4;
}

- (void)setPreferredAlternative:(int64_t)a3
{
  id v5 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v5 setPreferredAlternative:a3];
  }
  else if ([(MFMimeBody *)self numberOfAlternatives] >= 2)
  {
    *((_WORD *)self + 16) = a3;
  }
}

- (int64_t)preferredAlternative
{
  objc_super v3 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    int64_t v4 = *((__int16 *)self + 16);
    if (v4 != -1) {
      goto LABEL_20;
    }
    id v5 = [(MFMessageBody *)self message];
    uint64_t v6 = [(MFMimeBody *)self topLevelPart];
    BOOL v7 = [v5 defaultAlternativeInPart:v6];

    if (v7)
    {
      unsigned int v8 = [(MFMimePart *)self->_topLevelPart subparts];
      unint64_t v9 = [v8 count];
      if (v9)
      {
        unint64_t v10 = 1;
        do
        {
          int64_t v4 = v10 - 1;
          id v11 = [v8 objectAtIndex:v10 - 1];
          if (v11 != v7) {
            int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        while (v4 == 0x7FFFFFFFFFFFFFFFLL && v10++ < v9);

        if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_19;
        }
      }
      else
      {
      }
    }
    int64_t v4 = -1;
LABEL_19:

    goto LABEL_20;
  }
  int64_t v4 = [v3 preferredAlternative];
LABEL_20:

  return v4;
}

- (id)preferredBodyPart
{
  objc_super v3 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 preferredBodyPart];
  }
  else
  {
    id v5 = [(MFMimePart *)self->_topLevelPart startPart];
    int64_t v4 = objc_msgSend(v5, "alternativeAtIndex:", -[MFMimeBody preferredAlternative](self, "preferredAlternative"));
  }
  return v4;
}

- (id)textHtmlPart
{
  objc_super v3 = [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if ((v3
     || ([(MFMimePart *)self->_topLevelPart decodeIfNecessary],
         [(MFMimePart *)self->_topLevelPart decryptedMessageBodyIsEncrypted:0 isSigned:0], (objc_super v3 = objc_claimAutoreleasedReturnValue()) != 0))&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 textHtmlPart];
  }
  else
  {
    id v5 = [(MFMimeBody *)self preferredBodyPart];
    int64_t v4 = [v5 textHtmlPart];
  }
  return v4;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (NSArray)signers
{
  return self->_signers;
}

- (void)setSigners:(id)a3
{
}

@end