@interface MKPlacePublisherRefiner
- (MKPlacePublisherRefiner)initWithPublisherIdentifier:(unint64_t)a3;
- (MKPlacePublisherRefiner)initWithPublisherIdentifier:(unint64_t)a3 providerIdentifier:(int)a4;
- (void)fetchWithCallbackQueue:(id)a3 completion:(id)a4;
@end

@implementation MKPlacePublisherRefiner

- (MKPlacePublisherRefiner)initWithPublisherIdentifier:(unint64_t)a3
{
  return [(MKPlacePublisherRefiner *)self initWithPublisherIdentifier:a3 providerIdentifier:0];
}

- (MKPlacePublisherRefiner)initWithPublisherIdentifier:(unint64_t)a3 providerIdentifier:(int)a4
{
  v4 = self;
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    v13.receiver = self;
    v13.super_class = (Class)MKPlacePublisherRefiner;
    v7 = [(MKPlacePublisherRefiner *)&v13 init];
    if (v7)
    {
      v8 = [MKMapItemIdentifier alloc];
      uint64_t v9 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v8, "initWithMUID:resultProviderID:coordinate:", a3, v5, *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8));
      publisherIdentifier = v7->_publisherIdentifier;
      v7->_publisherIdentifier = (MKMapItemIdentifier *)v9;
    }
    v4 = v7;
    v11 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: publisherIdentifier != 0", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)fetchWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E4F14500];
    v16 = "Assertion failed: completion != ((void *)0)";
LABEL_9:
    _os_log_fault_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_FAULT, v16, buf, 2u);
    goto LABEL_4;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E4F14500];
    v16 = "Assertion failed: callbackQueue != ((void *)0)";
    goto LABEL_9;
  }
  v8 = +[MKMapService sharedService];
  publisherIdentifier = self->_publisherIdentifier;
  v10 = +[MKMapService sharedService];
  v11 = [v10 defaultTraits];
  v12 = [v8 ticketForPublisherViewPublisherIdentifier:publisherIdentifier keywordFilter:0 addressFilter:0 batchSize:1 withTraits:v11];
  ticket = self->_ticket;
  self->_ticket = v12;

  v14 = self->_ticket;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__MKPlacePublisherRefiner_fetchWithCallbackQueue_completion___block_invoke;
  v17[3] = &unk_1E54B8E48;
  id v18 = v7;
  [(MKMapServicePublisherViewTicket *)v14 submitWithCallbackQueue:v6 handler:v17 networkActivity:0];

LABEL_4:
}

void __61__MKPlacePublisherRefiner_fetchWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v21 = a4;
  id v7 = a5;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([@"Failed to refine publisher for identifier" length]) {
      [v8 setObject:@"Failed to refine publisher for identifier" forKey:*MEMORY[0x1E4F28568]];
    }
    [v8 setObject:@"Failed to refine publisher for identifier" forKey:*MEMORY[0x1E4F28A50]];
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    v10 = MKErrorDomain;
    v11 = (void *)[v8 copy];
    v12 = v9;
    objc_super v13 = v10;
    uint64_t v14 = 2;
LABEL_5:
    v15 = [v12 errorWithDomain:v13 code:v14 userInfo:v11];

    v16 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  v17 = [v21 publisher];

  if (!v17)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([@"No publisher result for identifier" length]) {
      [v8 setObject:@"No publisher result for identifier" forKey:*MEMORY[0x1E4F28568]];
    }
    v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = MKErrorDomain;
    v11 = (void *)[v8 copy];
    v12 = v19;
    objc_super v13 = v20;
    uint64_t v14 = 1;
    goto LABEL_5;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  v15 = [v21 publisher];
  v16 = *(void (**)(void))(v18 + 16);
LABEL_8:
  v16();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);

  objc_storeStrong((id *)&self->_publisherIdentifier, 0);
}

@end