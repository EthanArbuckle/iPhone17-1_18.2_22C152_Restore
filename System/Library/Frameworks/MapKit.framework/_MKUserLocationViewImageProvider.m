@interface _MKUserLocationViewImageProvider
- (_MKUserLocationViewImageProvider)init;
- (_MKUserLocationViewImageProvider)initWithUserLocationView:(id)a3;
- (id)_monogrammer;
- (void)_contactsChanged:(id)a3;
- (void)_updateContactImage;
- (void)_updateDefaultImage;
- (void)_updateImage;
@end

@implementation _MKUserLocationViewImageProvider

- (_MKUserLocationViewImageProvider)initWithUserLocationView:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_MKUserLocationViewImageProvider;
  v5 = [(_MKUserLocationViewImageProvider *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    uint64_t v7 = geo_dispatch_queue_create_with_qos();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = v6->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___MKUserLocationViewImageProvider_initWithUserLocationView___block_invoke;
    block[3] = &unk_1E54B8188;
    v10 = v6;
    v14 = v10;
    dispatch_async(v9, block);
    v11 = v10;
  }
  return v6;
}

- (void)_updateImage
{
  int v3 = objc_msgSend(MEMORY[0x1E4F1B980], "_mapkit_isAuthorized");
  id v4 = MKGetUserLocationViewLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Process is authorized for Contacts access", buf, 2u);
    }

    [(_MKUserLocationViewImageProvider *)self _updateContactImage];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_INFO, "Process is not authorized for Contacts access. Using default silhouette", v6, 2u);
    }

    [(_MKUserLocationViewImageProvider *)self _updateDefaultImage];
  }
}

- (void)_updateContactImage
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!self->_contactStore)
  {
    int v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    contactStore = self->_contactStore;
    self->_contactStore = v3;

    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__contactsChanged_ name:*MEMORY[0x1E4F1AF80] object:self->_contactStore];
  }
  v6 = [getCNMonogrammerClass() descriptorForRequiredKeysIncludingImage:1];
  uint64_t v7 = self->_contactStore;
  v21[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v9 = [(CNContactStore *)v7 _crossPlatformUnifiedMeContactWithKeysToFetch:v8 error:0];

  if (v9)
  {
    char v18 = 0;
    v10 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_INFO, "Generating monogram for contact: %@", buf, 0xCu);
    }

    v11 = [(_MKUserLocationViewImageProvider *)self _monogrammer];
    v12 = [v11 monogramForContact:v9 isContactImage:&v18];

    if (v12)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55___MKUserLocationViewImageProvider__updateContactImage__block_invoke;
      block[3] = &unk_1E54BCE60;
      void block[4] = self;
      id v16 = v12;
      char v17 = v18;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v14 = MKGetUserLocationViewLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v14, OS_LOG_TYPE_INFO, "Fetching contact monogram returned nil. Using default silhouette", buf, 2u);
      }

      [(_MKUserLocationViewImageProvider *)self _updateDefaultImage];
    }
  }
  else
  {
    v13 = MKGetUserLocationViewLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_INFO, "Fetching 'Me' contact returned nil. Using default silhouette", buf, 2u);
    }

    [(_MKUserLocationViewImageProvider *)self _updateDefaultImage];
  }
}

- (id)_monogrammer
{
  monogrammer = self->_monogrammer;
  if (!monogrammer)
  {
    id v4 = (CNMonogrammer *)[objc_alloc((Class)getCNMonogrammerClass()) initWithStyle:0 diameter:*(double *)&_MKBalloonCalloutInnerDiameter];
    BOOL v5 = self->_monogrammer;
    self->_monogrammer = v4;

    monogrammer = self->_monogrammer;
  }

  return monogrammer;
}

- (_MKUserLocationViewImageProvider)init
{
  result = (_MKUserLocationViewImageProvider *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)_contactsChanged:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___MKUserLocationViewImageProvider__contactsChanged___block_invoke;
  block[3] = &unk_1E54B8188;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateDefaultImage
{
  int v3 = [(_MKUserLocationViewImageProvider *)self _monogrammer];
  id v4 = [v3 silhouetteMonogram];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___MKUserLocationViewImageProvider__updateDefaultImage__block_invoke;
  v6[3] = &unk_1E54B8248;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_view);
}

@end