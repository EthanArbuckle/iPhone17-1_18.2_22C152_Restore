@interface MKStaticMapView
@end

@implementation MKStaticMapView

void __54___MKStaticMapView__displayGridWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  if (v4 && *(void *)(a1 + 48) == *(void *)(v5 + 616))
  {
    objc_storeStrong((id *)(v5 + 432), a2);
    v6 = [v8 image];
    [*(id *)(*(void *)(a1 + 32) + 416) setImage:v6];

    [*(id *)(a1 + 32) _showAllAnnotations];
    [*(id *)(*(void *)(a1 + 32) + 456) updateAnnotationViewsForReason:2];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  v7 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void *__36___MKStaticMapView__updateSnapshot___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[77] == *(void *)(a1 + 40)) {
    return (void *)[result _startSnapshotRequest];
  }
  return result;
}

void __41___MKStaticMapView__startSnapshotRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v7 + 616))
  {
    *(unsigned char *)(v7 + 626) = 0;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v16)
    {
      objc_storeStrong((id *)(v8 + 440), a2);
      v9 = [v16 image];
      [*(id *)(*(void *)(a1 + 32) + 416) setImage:v9];

      [*(id *)(a1 + 32) _showAllAnnotations];
      [*(id *)(*(void *)(a1 + 32) + 456) updateAnnotationViewsForReason:2];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 632));
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        goto LABEL_10;
      }
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 632));
      [v12 mapViewDidFinishLoadingMap:*(void *)(a1 + 32)];
      goto LABEL_9;
    }
    v13 = [*(id *)(v8 + 416) image];

    if (!v13) {
      [*(id *)(a1 + 32) _stopUpdatingUserLocation];
    }
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 632));
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 632));
      [v12 mapViewDidFailLoadingMap:*(void *)(a1 + 32) withError:v6];
LABEL_9:
    }
  }
LABEL_10:
}

uint64_t __51___MKStaticMapView_locationManagerUpdatedLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 520) setLocation:*(void *)(a1 + 40)];
}

uint64_t __38___MKStaticMapView_annotationRectTest__block_invoke()
{
  return 2;
}

uint64_t __44___MKStaticMapView_annotationCoordinateTest__block_invoke()
{
  return 1;
}

uint64_t __70___MKStaticMapView_annotationManager_didAddAnnotationRepresentations___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 448) selectAnnotation:*(void *)(*(void *)(a1 + 32) + 520) animated:0];
}

@end