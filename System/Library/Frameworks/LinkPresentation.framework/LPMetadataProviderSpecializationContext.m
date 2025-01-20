@interface LPMetadataProviderSpecializationContext
- (BOOL)fetchIsNotUserInitiated;
- (BOOL)hasLoadedResource;
- (BOOL)shouldFetchSubresources;
- (LPEvent)event;
- (LPMetadataProviderSpecializationContext)initWithOriginalURL:(id)a3 postRedirectURL:(id)a4 MIMEType:(id)a5 webView:(id)a6 hasLoadedResource:(BOOL)a7 shouldFetchSubresources:(BOOL)a8 allowedSpecializations:(unint64_t)a9 fetchIsNotUserInitiated:(BOOL)a10;
- (NSString)MIMEType;
- (NSURL)originalURL;
- (NSURL)postRedirectURL;
- (WKWebView)webView;
- (id)eventGenerator;
- (unint64_t)allowedSpecializations;
- (void)ensureEventWithSpecialization:(unint64_t)a3;
- (void)setEvent:(id)a3;
- (void)setEventGenerator:(id)a3;
@end

@implementation LPMetadataProviderSpecializationContext

- (LPMetadataProviderSpecializationContext)initWithOriginalURL:(id)a3 postRedirectURL:(id)a4 MIMEType:(id)a5 webView:(id)a6 hasLoadedResource:(BOOL)a7 shouldFetchSubresources:(BOOL)a8 allowedSpecializations:(unint64_t)a9 fetchIsNotUserInitiated:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v24 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LPMetadataProviderSpecializationContext;
  v20 = [(LPMetadataProviderSpecializationContext *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_originalURL, a3);
    objc_storeStrong((id *)&v21->_postRedirectURL, a4);
    objc_storeStrong((id *)&v21->_MIMEType, a5);
    objc_storeStrong((id *)&v21->_webView, a6);
    v21->_hasLoadedResource = a7;
    v21->_shouldFetchSubresources = a8;
    v21->_allowedSpecializations = a9;
    v21->_fetchIsNotUserInitiated = a10;
    v22 = v21;
  }

  return v21;
}

- (LPEvent)event
{
  v2 = self;
  objc_sync_enter(v2);
  event = v2->_event;
  if (!event)
  {
    uint64_t v4 = (*((void (**)(void))v2->_eventGenerator + 2))();
    v5 = v2->_event;
    v2->_event = (LPEvent *)v4;

    id eventGenerator = v2->_eventGenerator;
    v2->_id eventGenerator = 0;

    event = v2->_event;
  }
  v7 = event;
  objc_sync_exit(v2);

  return v7;
}

- (void)ensureEventWithSpecialization:(unint64_t)a3
{
  id v5 = [(LPMetadataProviderSpecializationContext *)self event];
  event = self->_event;

  [(LPEvent *)event setSpecialization:a3];
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (NSURL)postRedirectURL
{
  return self->_postRedirectURL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (BOOL)hasLoadedResource
{
  return self->_hasLoadedResource;
}

- (BOOL)shouldFetchSubresources
{
  return self->_shouldFetchSubresources;
}

- (BOOL)fetchIsNotUserInitiated
{
  return self->_fetchIsNotUserInitiated;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (unint64_t)allowedSpecializations
{
  return self->_allowedSpecializations;
}

- (void)setEvent:(id)a3
{
}

- (id)eventGenerator
{
  return self->_eventGenerator;
}

- (void)setEventGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventGenerator, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_postRedirectURL, 0);

  objc_storeStrong((id *)&self->_originalURL, 0);
}

@end