@interface CNUIMapTileGenerator
+ (double)defaultTileSize;
+ (id)defaultImage;
+ (id)mapTileImagesForPlacemark:(id)a3 snapshotterProvider:(id)a4 scheduler:(id)a5;
+ (id)placemarkForAddress:(id)a3 geocoderProvider:(id)a4 scheduler:(id)a5;
- (CNScheduler)workQueue;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIMapTileGenerator)init;
- (CNUIMapTileGenerator)initWithGeocoderProvider:(id)a3 snapshotterProvider:(id)a4 schedulerProvider:(id)a5;
- (id)geocoderProvider;
- (id)snapshotterProvider;
- (id)tilesForAddress:(id)a3;
@end

@implementation CNUIMapTileGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_snapshotterProvider, 0);

  objc_storeStrong(&self->_geocoderProvider, 0);
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (id)snapshotterProvider
{
  return self->_snapshotterProvider;
}

- (id)geocoderProvider
{
  return self->_geocoderProvider;
}

- (id)tilesForAddress:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNUIMapTileGenerator *)self geocoderProvider];
  v6 = [(CNUIMapTileGenerator *)self snapshotterProvider];
  v7 = [(CNUIMapTileGenerator *)self workQueue];
  v8 = [(CNUIMapTileGenerator *)self schedulerProvider];
  v9 = [(id)objc_opt_class() placemarkForAddress:v4 geocoderProvider:v5 scheduler:v7];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__CNUIMapTileGenerator_tilesForAddress___block_invoke;
  v24[3] = &unk_1E5496C88;
  id v25 = v7;
  id v26 = v6;
  v24[4] = self;
  id v10 = v7;
  id v11 = v6;
  v12 = [v9 flatMap:v24 schedulerProvider:v8];
  v13 = (void *)MEMORY[0x1E4F5A480];
  v14 = [MEMORY[0x1E4F1CA98] null];
  v15 = [v13 observableWithResult:v14];
  v16 = [v12 onError:v15];

  v17 = [(CNUIMapTileGenerator *)self schedulerProvider];
  v18 = [v17 backgroundScheduler];
  v19 = [v16 subscribeOn:v18];

  v20 = [(id)objc_opt_class() defaultImage];
  v27[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v22 = [v19 startWith:v21];

  return v22;
}

id __40__CNUIMapTileGenerator_tilesForAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() mapTileImagesForPlacemark:v3 snapshotterProvider:*(void *)(a1 + 48) scheduler:*(void *)(a1 + 40)];

  return v4;
}

- (CNUIMapTileGenerator)initWithGeocoderProvider:(id)a3 snapshotterProvider:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNUIMapTileGenerator;
  id v11 = [(CNUIMapTileGenerator *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id geocoderProvider = v11->_geocoderProvider;
    v11->_id geocoderProvider = (id)v12;

    uint64_t v14 = [v9 copy];
    id snapshotterProvider = v11->_snapshotterProvider;
    v11->_id snapshotterProvider = (id)v14;

    uint64_t v16 = [v10 newSerialSchedulerWithName:@"com.apple.contacts.ContactsUI.CNUIMapTileGenerator"];
    workQueue = v11->_workQueue;
    v11->_workQueue = (CNScheduler *)v16;

    objc_storeStrong((id *)&v11->_schedulerProvider, a5);
    v18 = v11;
  }

  return v11;
}

- (CNUIMapTileGenerator)init
{
  id v3 = +[CNUIContactsEnvironment currentEnvironment];
  id v4 = [v3 defaultSchedulerProvider];
  v5 = [(CNUIMapTileGenerator *)self initWithGeocoderProvider:&__block_literal_global_3331 snapshotterProvider:&__block_literal_global_4 schedulerProvider:v4];

  return v5;
}

id __28__CNUIMapTileGenerator_init__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (Class (__cdecl *)())getMKMapSnapshotterClass[0];
  id v3 = a2;
  id v4 = (void *)[objc_alloc(v2()) initWithOptions:v3];

  return v4;
}

id __28__CNUIMapTileGenerator_init__block_invoke()
{
  id v0 = objc_alloc_init((Class)getCLGeocoderClass[0]());

  return v0;
}

+ (id)mapTileImagesForPlacemark:(id)a3 snapshotterProvider:(id)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F5A480];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke;
  v16[3] = &unk_1E5496D50;
  id v17 = v9;
  id v18 = v7;
  id v19 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  uint64_t v14 = [v10 observableWithBlock:v16];

  return v14;
}

id __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_2;
  v8[3] = &unk_1E5496D28;
  id v4 = a1[4];
  id v9 = a1[5];
  id v12 = a1[6];
  id v10 = a1[4];
  id v11 = v3;
  id v5 = v3;
  v6 = [v4 performCancelableBlock:v8];

  return v6;
}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) location];
  [v4 coordinate];
  double v6 = v5;
  double v8 = v7;

  id v9 = objc_alloc_init((Class)getMKMapSnapshotOptionsClass[0]());
  objc_msgSend(v9, "setRegion:", v6, v8, 0.0075, 0.0075);
  objc_msgSend(v9, "setSize:", 91.0, 91.0);
  id v10 = objc_alloc((Class)getMKMapSnapshotFeatureAnnotationClass[0]());
  id v11 = [*(id *)(a1 + 32) location];
  [v11 coordinate];
  id v12 = objc_msgSend(v10, "initWithCoordinate:title:representation:", 0, 1);

  v28[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v9 _setCustomFeatureAnnotations:v13];

  uint64_t v14 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_3;
  v25[3] = &unk_1E549BF80;
  id v26 = *(id *)(a1 + 40);
  id v27 = v14;
  id v15 = v14;
  [v3 addCancelationBlock:v25];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 133, 7, @"Snapshotting %@…", v16, v17, v18, v19, *(void *)(a1 + 32));
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_5;
  v21[3] = &unk_1E5496D00;
  id v22 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 48);
  id v24 = v3;
  id v20 = v3;
  [v15 startWithCompletionHandler:v21];
}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_4;
  v2[3] = &unk_1E549B488;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performBlock:v2];
}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_6;
  v11[3] = &unk_1E5496CB0;
  id v12 = v5;
  id v13 = v6;
  double v7 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 performCancelableBlock:v11];
  [*(id *)(a1 + 48) addCancelable:v10];
}

void __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 32)) {
    BOOL v8 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 137, 7, @"Got a tile image!", a5, a6, a7, a8, 0);
    id v10 = *(void **)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) image];
    [v10 observerDidReceiveResult:v11];
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 140, 3, @"Error generating a snapshot: %@", a5, a6, a7, a8, *(void *)(a1 + 40));
  }
}

uint64_t __80__CNUIMapTileGenerator_mapTileImagesForPlacemark_snapshotterProvider_scheduler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

+ (id)placemarkForAddress:(id)a3 geocoderProvider:(id)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F5A480];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke;
  v16[3] = &unk_1E5496D50;
  id v18 = v7;
  id v19 = v8;
  id v17 = v9;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v10 observableWithBlock:v16];

  return v14;
}

id __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1[4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_2;
  v8[3] = &unk_1E5496D28;
  id v12 = a1[6];
  id v9 = a1[5];
  id v10 = a1[4];
  id v11 = v3;
  id v5 = v3;
  id v6 = [v4 performCancelableBlock:v8];

  return v6;
}

void __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_3;
  v16[3] = &unk_1E549B488;
  id v17 = v4;
  id v5 = v4;
  [v3 addCancelationBlock:v16];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 93, 7, @"Geocoding %@…", v6, v7, v8, v9, *(void *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_4;
  v12[3] = &unk_1E5496CD8;
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v11 = v3;
  [v5 geocodePostalAddress:v10 completionHandler:v12];
}

uint64_t __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelGeocode];
}

void __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_5;
  v11[3] = &unk_1E5496CB0;
  id v12 = v5;
  id v13 = v6;
  uint64_t v7 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = [v7 performCancelableBlock:v11];
  [*(id *)(a1 + 48) addCancelable:v10];
}

void __71__CNUIMapTileGenerator_placemarkForAddress_geocoderProvider_scheduler___block_invoke_5(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v2)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    if (!v3)
    {
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNUIContactsUIErrorDomain" code:301 userInfo:0];
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v13 = *MEMORY[0x1E4F28A50];
    v14[0] = v3;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v6 = [v4 errorWithDomain:@"CNUIContactsUIErrorDomain" code:301 userInfo:v5];

LABEL_6:
    [*(id *)(a1 + 48) observerDidFailWithError:v6];

    return;
  }
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_5;
  }
  id v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNUIMapTileGenerator.m", 98, 7, @"Geocoding: got placemark %@!", v7, v8, v9, v10, (uint64_t)v12);
  id v11 = (void *)[objc_alloc((Class)getMKPlacemarkClass[0]()) initWithPlacemark:v12];
  [*(id *)(a1 + 48) observerDidReceiveResult:v11];
}

+ (id)defaultImage
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageNamed:", @"MapTilePlaceholder");
}

+ (double)defaultTileSize
{
  return 91.0;
}

@end