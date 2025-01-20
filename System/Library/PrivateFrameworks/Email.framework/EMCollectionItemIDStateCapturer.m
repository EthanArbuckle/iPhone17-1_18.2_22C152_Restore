@interface EMCollectionItemIDStateCapturer
- (EMCollectionItemIDStateCapturer)initWithTitle:(id)a3 delegate:(id)a4;
- (EMCollectionItemIDStateCapturerDelegate)delegate;
- (id)descriptionForItem:(id)a3;
- (id)itemsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
@end

@implementation EMCollectionItemIDStateCapturer

- (EMCollectionItemIDStateCapturer)initWithTitle:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EMCollectionItemIDStateCapturer;
  v7 = [(EFListStateCapturer *)&v10 initWithTitle:a3 itemName:@"Item IDs" headLimit:200 tailLimit:100 delegate:self];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_delegate, v6);
  }

  return v8;
}

- (id)labelForStateCapture
{
  v2 = [(EMCollectionItemIDStateCapturer *)self delegate];
  v3 = [v2 labelForStateCapture];

  return v3;
}

- (id)itemsForStateCaptureWithErrorString:(id *)a3
{
  v4 = [(EMCollectionItemIDStateCapturer *)self delegate];
  v5 = [v4 itemIDsForStateCaptureWithErrorString:a3];

  return v5;
}

- (id)descriptionForItem:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 description];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (EMCollectionItemIDStateCapturerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EMCollectionItemIDStateCapturerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end