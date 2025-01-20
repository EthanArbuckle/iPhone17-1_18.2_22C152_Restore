@interface SCNMTLResourceManager(Textures)
@end

@implementation SCNMTLResourceManager(Textures)

- (void)newTextureWithDescriptor:()Textures .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)newTextureUsingMTKTextureLoaderWithURL:()Textures options:.cold.1(id *a1)
{
  [*a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: Failed to load image with error %@", v3, v4, v5, v6, v7);
}

- (void)newTextureUsingMTKTextureLoaderWithURL:()Textures options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_textureDescriptorFromImage:()Textures needsMipMap:textureOptions:.cold.1(uint64_t a1)
{
  C3DImageGetURL(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: Cannot load image %@. Using dummy texture.", v3, v4, v5, v6, v7);
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.2(uint64_t a1)
{
  C3DImageGetURL(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: Cannot load image %@. Texture will be garbage.", v3, v4, v5, v6, v7);
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_copyImage:()Textures toTexture:desc:textureOptions:needsMipMapGeneration:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renderResourceForImageProxy:()Textures sampler:engineContext:didFallbackToDefaultTexture:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renderResourceForImage:()Textures sampler:options:engineContext:didFallbackToDefaultTexture:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_20B249000, v1, OS_LOG_TYPE_ERROR, "Error: Failed to load texture named %@ : %@", v2, 0x16u);
}

@end