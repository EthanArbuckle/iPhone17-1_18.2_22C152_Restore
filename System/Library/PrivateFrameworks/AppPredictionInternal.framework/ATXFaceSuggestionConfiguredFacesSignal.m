@interface ATXFaceSuggestionConfiguredFacesSignal
- (ATXFaceSuggestionConfiguredFacesSignal)init;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
- (void)_prepare;
@end

@implementation ATXFaceSuggestionConfiguredFacesSignal

- (ATXFaceSuggestionConfiguredFacesSignal)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXFaceSuggestionConfiguredFacesSignal;
  v2 = [(ATXFaceSuggestionConfiguredFacesSignal *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ATXFaceSuggestionConfiguredFacesSignal *)v2 _prepare];
  }
  return v3;
}

- (void)_prepare
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXFaceSuggestionConfiguredFacesSignal _prepare]";
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: no posters in configuration cache!", (uint8_t *)&v1, 0xCu);
}

id __50__ATXFaceSuggestionConfiguredFacesSignal__prepare__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 galleryItem];
  v4 = [v3 extensionBundleIdentifier];
  objc_super v5 = [v2 galleryItem];

  v6 = [v5 descriptorIdentifier];
  v7 = descriptorKey(v4, v6);

  return v7;
}

- (double)valueForDescriptor:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 extensionBundleIdentifier];
  v6 = [v4 identifier];

  v7 = descriptorKey(v5, v6);

  if ([(NSCountedSet *)self->_configuredExtensionBundleIdentifiers countForObject:v7]) {
    double v8 = -5.0;
  }
  else {
    double v8 = 0.0;
  }

  return v8;
}

- (double)weight
{
  return 10.0;
}

- (void).cxx_destruct
{
}

@end