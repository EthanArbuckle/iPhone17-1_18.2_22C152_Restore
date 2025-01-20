@interface CNDraggingContact
+ (OS_os_log)os_log;
+ (id)availableDataRepresentationTypes;
- (CNContact)contact;
- (CNContactStore)contactStore;
- (CNDraggingContact)initWithContact:(id)a3 contactStore:(id)a4;
- (NSURL)cachedFileURLRepresentation;
- (id)dataRepresentationForType:(id)a3;
- (id)fetchContactWithKeys:(id)a3;
- (id)fileNameForContact:(id)a3;
- (id)fileURLRepresentation;
- (id)serializeContactToVCard:(id)a3;
- (void)cleanupFileURLRepresentation;
- (void)fileURLRepresentation;
- (void)setCachedFileURLRepresentation:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
@end

@implementation CNDraggingContact

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_14 != -1) {
    dispatch_once(&os_log_cn_once_token_0_14, &__block_literal_global_93);
  }
  v2 = (void *)os_log_cn_once_object_0_14;

  return (OS_os_log *)v2;
}

uint64_t __27__CNDraggingContact_os_log__block_invoke()
{
  os_log_cn_once_object_0_14 = (uint64_t)os_log_create("com.apple.contacts", "dragging");

  return MEMORY[0x1F41817F8]();
}

+ (id)availableDataRepresentationTypes
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CNContactIdentifiersPboardType";
  v4[1] = @"CNLinkedContactsIdentifiersPboardType";
  v4[2] = *MEMORY[0x1E4F22718];
  v4[3] = @"com.apple.contacts.vCardDisplayNames";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

- (CNDraggingContact)initWithContact:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    objc_storeStrong((id *)&self->_contactStore, a4);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchContactWithKeys:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNDraggingContact *)self contact];
  v46[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  int v7 = [v5 areKeysAvailable:v6];

  if (v7)
  {
    id v8 = [(CNDraggingContact *)self contact];
  }
  else
  {
    v9 = [(CNDraggingContact *)self contactStore];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      v11 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1909E3000, v11, OS_LOG_TYPE_INFO, "No contact store injected, using a store with default options", buf, 2u);
      }

      v12 = objc_alloc_init(CNContactStore);
      [(CNDraggingContact *)self setContactStore:v12];
    }
    *(void *)buf = 0;
    v33 = buf;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__23;
    v36 = __Block_byref_object_dispose__23;
    id v37 = 0;
    v13 = [(CNDraggingContact *)self contact];
    v14 = [v13 identifier];
    BOOL v15 = [v14 length] == 0;

    if (v15)
    {
      id v24 = 0;
    }
    else
    {
      v16 = [CNContactFetchRequest alloc];
      id v45 = v4;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      v18 = [(CNContactFetchRequest *)v16 initWithKeysToFetch:v17];

      [(CNContactFetchRequest *)v18 setOnlyMainStore:1];
      v19 = [(CNDraggingContact *)self contact];
      v20 = [v19 identifier];
      v44 = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      v22 = +[CNContact predicateForContactsWithIdentifiers:v21];
      [(CNContactFetchRequest *)v18 setPredicate:v22];

      v23 = [(CNDraggingContact *)self contactStore];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __42__CNDraggingContact_fetchContactWithKeys___block_invoke;
      v30[3] = &unk_1E56B4118;
      v30[4] = buf;
      id v31 = 0;
      [v23 enumerateContactsWithFetchRequest:v18 error:&v31 usingBlock:v30];
      id v24 = v31;
    }
    v25 = (void *)*((void *)v33 + 5);
    if (!v25)
    {
      v26 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = [(CNDraggingContact *)self contact];
        v29 = [(CNDraggingContact *)self contactStore];
        *(_DWORD *)v38 = 138412802;
        v39 = v28;
        __int16 v40 = 2114;
        v41 = v29;
        __int16 v42 = 2114;
        id v43 = v24;
        _os_log_error_impl(&dword_1909E3000, v26, OS_LOG_TYPE_ERROR, "Error refetching contact %@ from store %{public}@: %{public}@", v38, 0x20u);
      }
      v25 = (void *)*((void *)v33 + 5);
    }
    id v8 = v25;
    _Block_object_dispose(buf, 8);
  }

  return v8;
}

void __42__CNDraggingContact_fetchContactWithKeys___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)serializeContactToVCard:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB8C18];
  id v4 = a3;
  v5 = [v3 optionsFromPreferences];
  [v5 setIncludePhotos:1];
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  int v7 = +[CNContactVCardSerialization dataWithContacts:v6 options:v5 error:0];

  return v7;
}

- (id)fileNameForContact:(id)a3
{
  v3 = +[CNContactFormatter stringFromContact:a3 style:0];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    uint64_t v4 = [MEMORY[0x1E4F5A430] localizedStringForString:@"VCARD_DEFAULT_FILE_NAME" class:objc_opt_class() returningNilIfNotFound:1];

    v3 = (void *)v4;
  }
  v5 = [v3 stringByAppendingPathExtension:@"vcf"];

  return v5;
}

- (id)fileURLRepresentation
{
  v3 = [(CNDraggingContact *)self contact];

  if (v3)
  {
    uint64_t v4 = [(CNDraggingContact *)self cachedFileURLRepresentation];

    if (!v4)
    {
      v5 = +[CNContactVCardSerialization descriptorForRequiredKeys];
      v6 = [(CNDraggingContact *)self fetchContactWithKeys:v5];

      int v7 = [(CNDraggingContact *)self serializeContactToVCard:v6];
      id v8 = [MEMORY[0x1E4F5A3E8] sharedInstance];
      v9 = [v8 secureTemporarySubdirectoryWithName:@"DraggedItems"];

      BOOL v10 = [(CNDraggingContact *)self fileNameForContact:v6];
      v11 = [v9 URLByAppendingPathComponent:v10];

      id v17 = 0;
      int v12 = [v7 writeToURL:v11 options:1 error:&v17];
      id v13 = v17;
      if (v12)
      {
        [(CNDraggingContact *)self setCachedFileURLRepresentation:v11];
      }
      else
      {
        BOOL v15 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          [(CNDraggingContact *)v6 fileURLRepresentation];
        }
      }
    }
    v14 = [(CNDraggingContact *)self cachedFileURLRepresentation];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)cleanupFileURLRepresentation
{
  v3 = [(CNDraggingContact *)self cachedFileURLRepresentation];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [(CNDraggingContact *)self cachedFileURLRepresentation];
    [v4 removeItemAtURL:v5 error:0];

    [(CNDraggingContact *)self setCachedFileURLRepresentation:0];
  }
}

- (id)dataRepresentationForType:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNDraggingContact *)self contact];

  if (v5)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F22718]])
    {
      v6 = +[CNContactVCardSerialization descriptorForRequiredKeys];
      int v7 = [(CNDraggingContact *)self fetchContactWithKeys:v6];

      id v8 = [(CNDraggingContact *)self serializeContactToVCard:v7];
LABEL_6:

      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"CNContactIdentifiersPboardType"])
    {
      v9 = (void *)MEMORY[0x1E4F28F98];
      int v7 = [(CNDraggingContact *)self contact];
      BOOL v10 = [v7 identifier];
      v27[0] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      id v8 = [v9 dataWithPropertyList:v11 format:200 options:0 error:0];

      goto LABEL_6;
    }
    if ([v4 isEqualToString:@"CNLinkedContactsIdentifiersPboardType"])
    {
      int v12 = [(CNDraggingContact *)self contact];
      id v13 = [v12 linkedContacts];
      uint64_t v14 = [v13 count];

      BOOL v15 = [(CNDraggingContact *)self contact];
      v16 = v15;
      if (v14)
      {
        id v17 = [v15 linkedContacts];
        uint64_t v18 = objc_msgSend(v17, "_cn_map:", &__block_literal_global_32_0);
      }
      else
      {
        id v17 = [v15 identifier];
        v26 = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      }
      id v24 = (void *)v18;

      id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v24 format:200 options:0 error:0];

      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"com.apple.contacts.vCardDisplayNames"])
    {
      v19 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
      int v7 = [(CNDraggingContact *)self fetchContactWithKeys:v19];

      v20 = [(CNDraggingContact *)self fileNameForContact:v7];
      v21 = (void *)MEMORY[0x1E4F28F98];
      v25 = v20;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      id v8 = [v21 dataWithPropertyList:v22 format:200 options:0 error:0];

      goto LABEL_6;
    }
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

uint64_t __47__CNDraggingContact_dataRepresentationForType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (NSURL)cachedFileURLRepresentation
{
  return self->_cachedFileURLRepresentation;
}

- (void)setCachedFileURLRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFileURLRepresentation, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)fileURLRepresentation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 identifier];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1909E3000, a3, OS_LOG_TYPE_ERROR, "Error writing contact %@ to temporary file: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end