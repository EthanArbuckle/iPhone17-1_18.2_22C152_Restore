@interface MKCuratedCollectionItemsTicket
@end

@implementation MKCuratedCollectionItemsTicket

void __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  v14 = *(void **)(a1 + 40);
  if (v14)
  {
    if (v12)
    {
      v15 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2;
      block[3] = &unk_1E54B8360;
      id v16 = v14;
      id v58 = v16;
      id v17 = v13;
      id v57 = v17;
      if (v15) {
        dispatch_async(v15, block);
      }
      else {
        (*((void (**)(id, void, void, id))v16 + 2))(v16, 0, 0, v17);
      }

      id v41 = v58;
    }
    else
    {
      uint64_t v42 = a1;
      v43 = v9;
      v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
      id v45 = v11;
      if ([v11 count])
      {
        unint64_t v18 = 0;
        id v44 = v10;
        do
        {
          v19 = objc_msgSend(v11, "objectAtIndexedSubscript:", v18, v42);
          if (v18 >= [v10 count]) {
            goto LABEL_10;
          }
          v20 = [v19 _identifier];
          v21 = [v10 objectAtIndexedSubscript:v18];
          v22 = [v21 itemIdentifier];
          int v23 = [v20 isEqualToGEOMapItemIdentifier:v22];

          if (v23)
          {
            v24 = [v10 objectAtIndexedSubscript:v18];
          }
          else
          {
LABEL_10:
            unint64_t v47 = v18;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v25 = v10;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v59 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              v24 = 0;
              uint64_t v28 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v27; ++i)
                {
                  if (*(void *)v53 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  v31 = [v19 _identifier];
                  v32 = [v30 itemIdentifier];
                  int v33 = [v31 isEqualToGEOMapItemIdentifier:v32];

                  if (v33)
                  {
                    id v34 = v30;

                    v24 = v34;
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v59 count:16];
              }
              while (v27);
            }
            else
            {
              v24 = 0;
            }

            id v10 = v44;
            id v11 = v45;
            unint64_t v18 = v47;
          }
          v35 = [MKPlaceCollectionMapItem alloc];
          v36 = [[MKMapItem alloc] initWithGeoMapItem:v19 isPlaceHolderPlace:0];
          v37 = [(MKPlaceCollectionMapItem *)v35 initWithMapItem:v36 placeCollectionItem:v24];

          [v46 addObject:v37];
          ++v18;
        }
        while (v18 < [v11 count]);
      }
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
      v48[3] = &unk_1E54B83F8;
      v38 = *(NSObject **)(v42 + 32);
      id v39 = *(id *)(v42 + 40);
      id v51 = v39;
      id v9 = v43;
      id v40 = v43;
      id v49 = v40;
      id v50 = v46;
      id v41 = v46;
      if (v38) {
        dispatch_async(v38, v48);
      }
      else {
        (*((void (**)(id, id, id, void))v39 + 2))(v39, v40, v41, 0);
      }

      id v11 = v45;
      v13 = 0;
    }
  }
}

uint64_t __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end