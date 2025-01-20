@interface MTLTextureDescriptorInternal
- ($14D77461FF5D83CAEC4252578BA76F85)swizzle;
- (BOOL)allowGPUOptimizedContents;
- (BOOL)forceResourceIndex;
- (BOOL)framebufferOnly;
- (BOOL)isDrawable;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateWithDevice:(id)a3;
- (BOOL)writeSwizzleEnabled;
- (MTLTextureDescriptorInternal)init;
- (const)descriptorPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (int64_t)compressionType;
- (unint64_t)arrayLength;
- (unint64_t)colorSpaceConversionMatrix;
- (unint64_t)compressionFootprint;
- (unint64_t)compressionMode;
- (unint64_t)cpuCacheMode;
- (unint64_t)depth;
- (unint64_t)hash;
- (unint64_t)hazardTrackingMode;
- (unint64_t)height;
- (unint64_t)mipmapLevelCount;
- (unint64_t)pixelFormat;
- (unint64_t)protectionOptions;
- (unint64_t)resourceIndex;
- (unint64_t)resourceOptions;
- (unint64_t)rotation;
- (unint64_t)sampleCount;
- (unint64_t)sparseSurfaceDefaultValue;
- (unint64_t)storageMode;
- (unint64_t)textureType;
- (unint64_t)usage;
- (unint64_t)width;
- (unsigned)swizzleKey;
- (void)setAllowGPUOptimizedContents:(BOOL)a3;
- (void)setArrayLength:(unint64_t)a3;
- (void)setColorSpaceConversionMatrix:(unint64_t)a3;
- (void)setCompressionFootprint:(unint64_t)a3;
- (void)setCompressionMode:(unint64_t)a3;
- (void)setCompressionType:(int64_t)a3;
- (void)setCpuCacheMode:(unint64_t)a3;
- (void)setDepth:(unint64_t)a3;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setFramebufferOnly:(BOOL)a3;
- (void)setHazardTrackingMode:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setIsDrawable:(BOOL)a3;
- (void)setMipmapLevelCount:(unint64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setProtectionOptions:(unint64_t)a3;
- (void)setResourceIndex:(unint64_t)a3;
- (void)setResourceOptions:(unint64_t)a3;
- (void)setRotation:(unint64_t)a3;
- (void)setSampleCount:(unint64_t)a3;
- (void)setSparseSurfaceDefaultValue:(unint64_t)a3;
- (void)setStorageMode:(unint64_t)a3;
- (void)setSwizzle:(id)a3;
- (void)setSwizzleKey:(unsigned int)a3;
- (void)setTextureType:(unint64_t)a3;
- (void)setUsage:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
- (void)setWriteSwizzleEnabled:(BOOL)a3;
@end

@implementation MTLTextureDescriptorInternal

- (unint64_t)protectionOptions
{
  return self->_private.protectionOptions;
}

- (void)setUsage:(unint64_t)a3
{
  self->_private.var0.textureUsage = a3;
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setProtectionOptions:(unint64_t)a3
{
  self->_private.protectionOptions = a3;
}

- (void)setMipmapLevelCount:(unint64_t)a3
{
  self->_private.mipmapLevelCount = a3;
}

- (void)setWidth:(unint64_t)a3
{
  self->_private.width = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_private.height = a3;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_private.pixelFormat = a3;
}

- (void)setTextureType:(unint64_t)a3
{
  self->_private.textureType = a3;
}

- (MTLTextureDescriptorInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLTextureDescriptorInternal;
  v2 = [(MTLTextureDescriptorInternal *)&v6 init];
  v3 = (MTLTextureDescriptorInternal *)v2;
  if (v2)
  {
    int64x2_t v4 = vdupq_n_s64(1uLL);
    *(_OWORD *)(v2 + 8) = xmmword_1828F0B50;
    *(int64x2_t *)(v2 + 24) = v4;
    *(int64x2_t *)(v2 + 40) = v4;
    *(int64x2_t *)(v2 + 56) = v4;
    *((_WORD *)v2 + 68) = 1;
    *((void *)v2 + 18) = 0;
    *((_DWORD *)v2 + 23) = 84148994;
    *((void *)v2 + 10) = 0;
    *((_OWORD *)v2 + 12) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *((void *)v2 + 13) = 0;
    *((_WORD *)v2 + 44) = 0;
    *((void *)v2 + 20) = 0;
    *(_OWORD *)(v2 + 168) = 0u;
    *((void *)v2 + 14) = dyld_program_sdk_at_least();
    v3->_private.protectionOptions = 0;
  }
  return v3;
}

- (const)descriptorPrivate
{
  return &self->_private;
}

- (BOOL)validateWithDevice:(id)a3
{
  uint64_t v178 = 0;
  memset(v177, 0, sizeof(v177));
  _MTLMessageContextBegin_((uint64_t)v177, (uint64_t)"-[MTLTextureDescriptorInternal validateWithDevice:]", 1405, (uint64_t)a3, 0, (uint64_t)"Texture Descriptor Validation");
  p_private = &self->_private;
  unint64_t textureUsage = self->_private.var0.textureUsage;
  if (textureUsage)
  {
    unint64_t v7 = textureUsage & 0x14017;
LABEL_6:
    self->_private.resolvedUsage = v7;
    goto LABEL_7;
  }
  self->_private.resolvedUsage = 23;
  if (self->_private.swizzle != 84148994)
  {
    unint64_t v7 = 23;
    if (!self->_private.writeSwizzleEnabled) {
      unint64_t v7 = 17;
    }
    goto LABEL_6;
  }
LABEL_7:
  unint64_t v8 = [(MTLTextureDescriptorInternal *)self textureType];
  if (v8 >= 0xA) {
    _MTLMessageContextPush_((uint64_t)v177, 4, @"type (%lu) is not a valid MTLTextureType.", v9, v10, v11, v12, v13, v8);
  }
  unint64_t v14 = [(MTLTextureDescriptorInternal *)self cpuCacheMode];
  if (v14 >= 2) {
    _MTLMessageContextPush_((uint64_t)v177, 4, @"invalid cpuCacheMode (%lu)", v15, v16, v17, v18, v19, v14);
  }
  validateMTLStorageMode([(MTLTextureDescriptorInternal *)self storageMode], (uint64_t)v177);
  unint64_t v20 = [(MTLTextureDescriptorInternal *)self resourceOptions];
  unint64_t v26 = v20;
  uint64_t v27 = v20 >> 4;
  if ((v20 & 0xF) >= 2) {
    _MTLMessageContextPush_((uint64_t)v177, 4, @"invalid cpuCacheMode (%lu)", v21, v22, v23, v24, v25, v20 & 0xF);
  }
  validateMTLStorageMode(v27, (uint64_t)v177);
  if ((v26 & 0xFFFFFFFFFFF0FC00) != 0) {
    _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLResourceOptions (0x%lx) contains unknown bits.", v28, v29, v30, v31, v32, v26 & 0xFFFFFFFFFFF0FC00);
  }
  unint64_t v33 = [(MTLTextureDescriptorInternal *)self usage];
  if (v33 && (v33 & 0xFFFFFFFFFFFEBFC0) != 0) {
    _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureUsage has unknown bits 0x%lx.", v34, v35, v36, v37, v38, v33 & 0xFFFFFFFFFFFEBFC0);
  }
  switch(p_private->textureType)
  {
    case 0uLL:
      uint64_t v47 = [a3 maxTextureWidth1D];
      goto LABEL_28;
    case 1uLL:
      unint64_t v39 = [a3 maxTextureWidth1D];
      unint64_t v46 = [a3 maxTextureLayers];
      unint64_t v45 = 1;
      goto LABEL_23;
    case 2uLL:
    case 4uLL:
      unint64_t v39 = [a3 maxTextureWidth2D];
      unint64_t v45 = [a3 maxTextureHeight2D];
      goto LABEL_29;
    case 3uLL:
    case 8uLL:
      unint64_t v39 = [a3 maxTextureWidth2D];
      unint64_t v45 = [a3 maxTextureHeight2D];
      unint64_t v46 = [a3 maxTextureLayers];
LABEL_23:
      unint64_t v48 = 1;
      goto LABEL_31;
    case 5uLL:
      unint64_t v39 = [a3 maxTextureDimensionCube];
      unint64_t v48 = 1;
      unint64_t v45 = v39;
      goto LABEL_30;
    case 6uLL:
      unint64_t v39 = [a3 maxTextureDimensionCube];
      unint64_t v46 = [a3 maxTextureLayers];
      unint64_t v48 = 1;
      unint64_t v45 = v39;
      goto LABEL_31;
    case 7uLL:
      unint64_t v39 = [a3 maxTextureWidth3D];
      unint64_t v45 = [a3 maxTextureHeight3D];
      unint64_t v48 = [a3 maxTextureDepth3D];
      goto LABEL_30;
    case 9uLL:
      uint64_t v47 = [a3 maxTextureBufferWidth];
LABEL_28:
      unint64_t v39 = v47;
      unint64_t v45 = 1;
LABEL_29:
      unint64_t v48 = 1;
LABEL_30:
      unint64_t v46 = 1;
LABEL_31:
      unint64_t width = self->_private.width;
      if (!width)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has width of zero.", v40, v41, v42, v43, v44, Name);
        unint64_t width = self->_private.width;
      }
      if (width > v39) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has width (%lu) greater than the maximum allowed size of %lu.", v40, v41, v42, v43, v44, width);
      }
      unint64_t height = self->_private.height;
      if (!height)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has height of zero.", v40, v41, v42, v43, v44, Name);
        unint64_t height = self->_private.height;
      }
      if (height > v45) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has height (%lu) greater than the maximum allowed size of %lu.", v40, v41, v42, v43, v44, height);
      }
      unint64_t depth = self->_private.depth;
      if (!depth)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has depth of zero.", v40, v41, v42, v43, v44, Name);
        unint64_t depth = self->_private.depth;
      }
      if (depth > v48) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has depth (%lu) greater than the maximum allowed size of %lu.", v40, v41, v42, v43, v44, depth);
      }
      unint64_t arrayLength = self->_private.arrayLength;
      if (!arrayLength)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has arrayLength of zero.", v40, v41, v42, v43, v44, Name);
        unint64_t arrayLength = self->_private.arrayLength;
      }
      if (arrayLength > v46) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has arrayLength (%lu) greater than the maximum allowed size of %lu.", v40, v41, v42, v43, v44, arrayLength);
      }
      if ([(MTLTextureDescriptorInternal *)self rotation] >= 5) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"rotation is not a valid MTLTextureRotation.", v53, v54, v55, v56, v57, Name);
      }
      if ([(MTLTextureDescriptorInternal *)self compressionMode] >= 3) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"compressionMode is not a valid MTLTextureCompressionMode.", v58, v59, v60, v61, v62, Name);
      }
      if ([(MTLTextureDescriptorInternal *)self compressionFootprint] >= 4) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"compressionFootprint is not a valid MTLTextureCompressionFootprint.", v63, v64, v65, v66, v67, Name);
      }
      if (([(MTLTextureDescriptorInternal *)self usage] & 0x20) == 0) {
        goto LABEL_60;
      }
      unint64_t pixelFormat = self->_private.pixelFormat;
      if (pixelFormat - 53 < 2) {
        goto LABEL_60;
      }
      if (pixelFormat == 103)
      {
        if ([a3 supportsAtomicUlongVoidMinMax]) {
          goto LABEL_60;
        }
        v74 = @"This device does not support ulong texture atomics, so MTLPixelFormatRG32Uint cannot be used with texture atomics";
      }
      else
      {
        uint64_t Name = MTLPixelFormatGetName(pixelFormat);
        v74 = @"%s is not a valid format to be used with texture atomics.";
      }
      _MTLMessageContextPush_((uint64_t)v177, 4, (uint64_t)v74, v69, v70, v71, v72, v73, Name);
LABEL_60:
      uint64_t v176 = 0;
      memset(v175, 0, sizeof(v175));
      MTLPixelFormatGetInfoForDevice(a3, self->_private.pixelFormat, (uint64_t)v175);
      unint64_t compressionFootprint = self->_private.compressionFootprint;
      unint64_t compressionType = self->_private.compressionType;
      if (compressionType >= 2) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"compressionType is not a valid MTLTextureCompressionType.", v77, v78, v79, v80, v81, Name);
      }
      if (compressionType != 1 && !compressionFootprint) {
        goto LABEL_98;
      }
      if (![a3 supportsLossyCompression])
      {
        v140 = @"MTLTextureDescriptor has compressionType set to MTLTextureCompressionTypeLossy, but the device does not support lossy compression";
LABEL_225:
        _MTLMessageContextPush_((uint64_t)v177, 4, (uint64_t)v140, v77, v78, v79, v80, v81, Name);
        goto LABEL_98;
      }
      if (BYTE8(v175[0]))
      {
        if (compressionFootprint == 2) {
          int v84 = 0x2000000;
        }
        else {
          int v84 = 0x4000000;
        }
        if (compressionFootprint == 1) {
          int v84 = 0x1000000;
        }
        int v85 = DWORD2(v175[0]) & v84;
        if (compressionType == 1)
        {
          if (!v85) {
            _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has compressionType set to MTLTextureCompressionTypeLossy, but the pixel format %s does not support lossy compression", v77, v78, v79, v80, v81, *(uint64_t *)&v175[0]);
          }
        }
        else if (!v85)
        {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor uses compressionFootprint %d, but the pixel format %s does not support that lossy compression mode on this device", v77, v78, v79, v80, v81, compressionFootprint);
        }
      }
      unint64_t textureType = p_private->textureType;
      if (compressionFootprint == 3)
      {
        if (textureType <= 9 && ((1 << textureType) & 0x203) != 0)
        {
          v87 = "uses compressionFootprint enabled";
          if (compressionType == 1) {
            v87 = "has compressionType set to MTLTextureCompressionTypeLossy";
          }
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor %s, which is not supported for 1D, 1DArray or TextureBuffer texture types", v77, v78, v79, v80, v81, (uint64_t)v87);
        }
      }
      else
      {
        if (textureType != 2) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor uses compressionFootprint %d, which does not support any textureType other than MTLTextureType2D", v77, v78, v79, v80, v81, compressionFootprint);
        }
        if (p_private->mipmapLevelCount != 1) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor uses compressionFootprint %d, which does not support any mipmapLevelCount other than 1", v77, v78, v79, v80, v81, compressionFootprint);
        }
      }
      if (compressionType == 1 && (p_private->resourceOptions & 0xF0) != 0x20) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has compressionType set to MTLTextureCompressionTypeLossy, but the storageMode is not MTLStorageModePrivate", v77, v78, v79, v80, v81, Name);
      }
      unint64_t v88 = p_private->var0.textureUsage;
      if ((v88 & 0x4000) != 0 || (v88 & 2) == 0 || p_private->compressionMode == 1)
      {
        if ((v88 & 0x10) == 0) {
          goto LABEL_93;
        }
        goto LABEL_241;
      }
      v167 = "uses compressionFootprint enabled";
      if (compressionType == 1) {
        v167 = "has compressionType set to MTLTextureCompressionTypeLossy";
      }
      _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor %s, but usage includes MTLTextureUsageShaderWrite", v77, v78, v79, v80, v81, (uint64_t)v167);
      if ((p_private->var0.textureUsage & 0x10) != 0)
      {
LABEL_241:
        v168 = "uses compressionFootprint enabled";
        if (compressionType == 1) {
          v168 = "has compressionType set to MTLTextureCompressionTypeLossy";
        }
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor %s, but usage includes MTLTextureUsagePixelFormatView", v77, v78, v79, v80, v81, (uint64_t)v168);
      }
LABEL_93:
      if (p_private->compressionMode == 2) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has compressionMode set to optOut, but requests lossy compression", v77, v78, v79, v80, v81, Name);
      }
      if (!p_private->allowGPUOptimizedContents) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has compressionType set to MTLTextureCompressionTypeLossy, but allowGPUOptimizedContents is set to NO", v77, v78, v79, v80, v81, Name);
      }
      if ((p_private->var0.textureUsage & 0x20) != 0)
      {
        v140 = @"MTLTextureDescriptor has compressionType set to MTLTextureCompressionTypeLossy, but usage includes MTLTextureUsageShaderAtomic";
        goto LABEL_225;
      }
LABEL_98:
      if ((BYTE8(v175[0]) & 1) == 0) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has invalid pixelFormat (%lu).", v77, v78, v79, v80, v81, p_private->pixelFormat);
      }
      if (p_private->textureType == 6) {
        MTLValidateFeatureSupport((id *)a3, 107, 0);
      }
      _mtlValidateMTLTextureSwizzleKey(p_private->swizzle, v75, v76, v77, v78, v79, v80, v81);
      if (p_private->swizzle != 84148994)
      {
        MTLValidateFeatureSupport((id *)a3, 93, 0);
        uint64_t v94 = 6;
        if (p_private->writeSwizzleEnabled) {
          uint64_t v94 = 0;
        }
        uint64_t v95 = v94 & p_private->resolvedUsage;
        if (v95)
        {
          uint64_t v141 = [MTLTextureUsageString(v95) UTF8String];
          _MTLMessageContextPush_((uint64_t)v177, 4, @"Texture swizzling is not compatable with %s", v142, v143, v144, v145, v146, v141);
        }
      }
      unint64_t v96 = p_private->textureType;
      if (p_private->textureType > 1) {
        goto LABEL_108;
      }
      uint64_t v98 = p_private->height;
      if (v98 != 1)
      {
        v147 = @"Unknown";
        if (v96 == 1) {
          v147 = @"MTLTextureType1DArray";
        }
        v148 = v96 ? v147 : @"MTLTextureType1D";
        [(__CFString *)v148 UTF8String];
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor requests a height of %lu but the texture type %s requires that height is 1", v149, v150, v151, v152, v153, v98);
        unint64_t v96 = p_private->textureType;
        if (p_private->textureType > 1)
        {
LABEL_108:
          unint64_t v97 = p_private->depth;
          if (v96 == 7) {
            goto LABEL_114;
          }
          goto LABEL_113;
        }
      }
      uint64_t mipmapLevelCount = p_private->mipmapLevelCount;
      if (mipmapLevelCount != 1)
      {
        v154 = @"Unknown";
        if (v96 == 1) {
          v154 = @"MTLTextureType1DArray";
        }
        if (v96) {
          v155 = v154;
        }
        else {
          v155 = @"MTLTextureType1D";
        }
        [(__CFString *)v155 UTF8String];
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor requests a mipmapLevelCount of %lu but the texture type %s requires that mipmapLevelCount is 1", v156, v157, v158, v159, v160, mipmapLevelCount);
        unint64_t v96 = p_private->textureType;
        goto LABEL_108;
      }
      unint64_t v97 = p_private->depth;
LABEL_113:
      if (v97 != 1)
      {
        if (v96 > 9) {
          v138 = @"Unknown";
        }
        else {
          v138 = (__CFString *)*((void *)&off_1E52208E8 + v96);
        }
        [(__CFString *)v138 UTF8String];
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor requests a depth of %lu but the texture type %s requires that depth is 1", v161, v162, v163, v164, v165, v97);
        unint64_t v97 = p_private->depth;
      }
LABEL_114:
      if (p_private->width <= p_private->height) {
        unint64_t v100 = p_private->height;
      }
      else {
        unint64_t v100 = p_private->width;
      }
      if (v100 <= v97) {
        unint64_t v100 = v97;
      }
      unint64_t v101 = 64 - __clz(v100);
      uint64_t v102 = p_private->mipmapLevelCount;
      if (v102 - 1 >= v101) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor requests %lu mipmap levels, but the dimensions (%lu, %lu, %lu) can only support a maxiumum of %lu levels", v89, v90, v91, v92, v93, v102);
      }
      unint64_t v103 = p_private->textureType;
      if (p_private->textureType == 4 || v103 == 8)
      {
        if (p_private->mipmapLevelCount != 1) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor mipmapLevelCount must equal 1 for multisample textures.", v89, v90, v91, v92, v93, Name);
        }
        if ((BYTE9(v175[0]) & 1) == 0) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor pixelFormat (%s) does not support multisample textures.", v89, v90, v91, v92, v93, *(uint64_t *)&v175[0]);
        }
        if (p_private->sampleCount <= 1) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor sampleCount must be > 1 for multisample textures.", v89, v90, v91, v92, v93, Name);
        }
        if ((objc_msgSend(a3, "supportsTextureSampleCount:") & 1) == 0) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor sampleCount (%lu) is not supported by device.", v89, v90, v91, v92, v93, p_private->sampleCount);
        }
      }
      else if (p_private->sampleCount != 1)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has sampleCount set but is using a type that does not allow sampleCount.", v89, v90, v91, v92, v93, Name);
      }
      unint64_t v104 = p_private->textureType;
      if (p_private->textureType - 5 <= 1 && p_private->width != p_private->height)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor width must equal height for cube textures.", v89, v90, v91, v92, v93, Name);
        unint64_t v104 = p_private->textureType;
      }
      if (v104 <= 8 && ((1 << v104) & 0x14A) != 0)
      {
        unint64_t v105 = [a3 maxTextureLayers];
        if (p_private->textureType == 6) {
          unint64_t v106 = v105 / 6;
        }
        else {
          unint64_t v106 = v105;
        }
        if (p_private->arrayLength - 1 >= v106) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor arrayLength (%lu) is set to zero or greater than the max allowed size (%lu).", v89, v90, v91, v92, v93, p_private->arrayLength);
        }
      }
      else
      {
        uint64_t v107 = p_private->arrayLength;
        if (v107 != 1)
        {
          if (v104 > 9) {
            v166 = @"Unknown";
          }
          else {
            v166 = (__CFString *)*((void *)&off_1E5220938 + v104);
          }
          [(__CFString *)v166 UTF8String];
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor requests an arrayLength of %lu, but %s requires that arrayLength is 1", v169, v170, v171, v172, v173, v107);
        }
      }
      int v108 = DWORD2(v175[0]);
      if ((WORD4(v175[0]) & 0x400) != 0)
      {
        if (p_private->sampleCount >= 2)
        {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has a compressed pixel format set with a sample count greater than one.", v89, v90, v91, v92, v93, Name);
          int v108 = DWORD2(v175[0]);
        }
        if ((v108 & 0x1000) != 0 && p_private->textureType == 7)
        {
          MTLValidateFeatureSupport((id *)a3, 71, 0);
          goto LABEL_158;
        }
        unint64_t v109 = p_private->textureType;
        if ((v108 & 0x400000) == 0 || v109 != 7)
        {
          if (v109 > 7) {
            goto LABEL_157;
          }
          if (((1 << v109) & 0x6C) != 0) {
            goto LABEL_158;
          }
          if (v109 == 7) {
            _MTLMessageContextPush_((uint64_t)v177, 4, @"The compressed pixel format %s cannot be used with MTLTextureType3D.", v89, v90, v91, v92, v93, *(uint64_t *)&v175[0]);
          }
          else {
LABEL_157:
          }
            _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: compressed pixel formats require texture type of MTLTextureType2D[Array]%s or MTLTextureTypeCube[Array].", v89, v90, v91, v92, v93, (uint64_t)", MTLTextureType3D");
        }
LABEL_158:
        if ((BYTE9(v175[0]) & 0x20) != 0)
        {
          if (p_private->textureType == 7) {
            _MTLMessageContextPush_((uint64_t)v177, 4, @"PVRTC 3D textures are not supported", v89, v90, v91, v92, v93, Name);
          }
          unint64_t v110 = p_private->width;
          if ((v110 & (v110 - 1)) != 0
            || (int8x8_t v111 = (int8x8_t)p_private->height, v110 != *(void *)&v111)
            || (uint8x8_t v112 = (uint8x8_t)vcnt_s8(v111), v112.i16[0] = vaddlv_u8(v112), v112.u32[0] >= 2uLL))
          {
            _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has a PVRTC pixel format (%s) set with non-square and/or non-power of two dimensions.", v89, v90, v91, v92, v93, *(uint64_t *)&v175[0]);
          }
        }
      }
      if (p_private->rotation && !p_private->framebufferOnly) {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor has a non-zero rotation set but is not marked as framebufferOnly.", v89, v90, v91, v92, v93, Name);
      }
      if ((BYTE9(v175[0]) & 0x40) != 0)
      {
        if (p_private->mipmapLevelCount >= 2) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor requests %lu mipmap levels, but the MTLPixelFormat422 pixel format does not support mipmaps.", v89, v90, v91, v92, v93, p_private->mipmapLevelCount);
        }
        if (p_private->textureType != 2) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: MTLPixelFormat422 requires MTLTextureType2D.", v89, v90, v91, v92, v93, Name);
        }
        if (p_private->width) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: MTLPixelFormat422 requires even width.", v89, v90, v91, v92, v93, Name);
        }
      }
      char v113 = [a3 supportsNonPrivateDepthStencilTextures];
      char v114 = [a3 supportsNonPrivateMSAATextures];
      char v115 = [a3 supportsMemorylessRenderTargets];
      int v121 = BYTE8(v175[0]) & 0x60;
      unint64_t resourceOptions = p_private->resourceOptions;
      if ((resourceOptions & 0xF0) == 0x30) {
        char v123 = v115;
      }
      else {
        char v123 = 1;
      }
      if ((v123 & 1) == 0)
      {
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: MTLResourceStorageModeMemoryless is not a supported storage mode on this device.", v116, v117, v118, v119, v120, Name);
        if (!v121) {
          goto LABEL_186;
        }
LABEL_180:
        if (p_private->textureType - 2 >= 5 && p_private->textureType != 8) {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: depth/stencil pixel formats require texture type of MTLTextureType2D[Array] or MTLTextureTypeCube[Array].", v116, v117, v118, v119, v120, Name);
        }
        if ((resourceOptions & 0xF0) != 0) {
          char v124 = 1;
        }
        else {
          char v124 = v113;
        }
        if (v124)
        {
          if (v123) {
            goto LABEL_186;
          }
        }
        else
        {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: Depth, Stencil, DepthStencil textures cannot be allocated with MTLStorageModeShared on this device.", v116, v117, v118, v119, v120, Name);
          if (v123) {
            goto LABEL_186;
          }
        }
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: Depth, Stencil, DepthStencil textures cannot be allocated with MTLResourceStorageModeMemoryless on this device.", v116, v117, v118, v119, v120, Name);
        goto LABEL_186;
      }
      if ((BYTE8(v175[0]) & 0x60) != 0) {
        goto LABEL_180;
      }
LABEL_186:
      if (v103 == 8 || v103 == 4)
      {
        if ((resourceOptions & 0xF0) != 0) {
          char v125 = 1;
        }
        else {
          char v125 = v114;
        }
        if (v125)
        {
          if (v123) {
            goto LABEL_193;
          }
        }
        else
        {
          _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: Multisample textures cannot be allocated with MTLStorageModeShared on this device.", v116, v117, v118, v119, v120, Name);
          if (v123) {
            goto LABEL_193;
          }
        }
        _MTLMessageContextPush_((uint64_t)v177, 4, @"MTLTextureDescriptor: Multisample textures cannot be allocated with MTLResourceStorageModeMemoryless on this device.", v116, v117, v118, v119, v120, Name);
      }
LABEL_193:
      if (p_private->textureType != 8) {
        goto LABEL_199;
      }
      if (![a3 supportsTexture2DMultisampleArray])
      {
        if ((resourceOptions & 0xF0) == 0x30) {
          goto LABEL_199;
        }
        v131 = @"MTLTextureType2DMultisampleArray is not supported on this device unless used with MTLResourceStorageModeMemoryless";
        goto LABEL_235;
      }
      if ((resourceOptions & 0xE0) != 0x20 && (resourceOptions & 0xF0) != 0)
      {
        v131 = @"MTLTextureType2DMultisampleArray is not supported on this device unless used with MTLResourceStorageModeMemoryless, MTLResourceStorageModePrivate, or MTLResourceStorageModeShared";
LABEL_235:
        _MTLMessageContextPush_((uint64_t)v177, 4, (uint64_t)v131, v126, v127, v128, v129, v130, Name);
      }
LABEL_199:
      if (p_private->colorSpaceConversionMatrix)
      {
        if ([a3 supportsColorSpaceConversionMatrixSelection])
        {
          if (p_private->colorSpaceConversionMatrix < 0xB) {
            goto LABEL_202;
          }
          uint64_t Name = p_private->colorSpaceConversionMatrix;
          v139 = @"MTLTextureColorSpaceConversionMatrix (%lu) is not supported by this version of Metal.";
        }
        else
        {
          v139 = @"MTLTextureColorSpaceConversionMatrix selection is not supported on this device.";
        }
        _MTLMessageContextPush_((uint64_t)v177, 4, (uint64_t)v139, v132, v133, v134, v135, v136, Name);
      }
LABEL_202:
      _MTLMessageContextEnd((uint64_t)v177);
      return *(void *)&v177[0] == 0;
    default:
      abort();
  }
}

- (unint64_t)usage
{
  return self->_private.var0.textureUsage;
}

- (unint64_t)resourceOptions
{
  return self->_private.resourceOptions;
}

- (unint64_t)storageMode
{
  return self->_private.resourceOptions >> 4;
}

- (unint64_t)textureType
{
  return self->_private.textureType;
}

- (unint64_t)rotation
{
  return self->_private.rotation;
}

- (unint64_t)cpuCacheMode
{
  return self->_private.resourceOptions & 0xF;
}

- (unint64_t)compressionMode
{
  return self->_private.compressionMode;
}

- (unint64_t)compressionFootprint
{
  return self->_private.compressionFootprint;
}

- (unint64_t)pixelFormat
{
  return self->_private.pixelFormat;
}

- (void)setStorageMode:(unint64_t)a3
{
  if (a3 == 3)
  {
    if (isMemoryLessStorageDisabled_onceToken != -1) {
      dispatch_once(&isMemoryLessStorageDisabled_onceToken, &__block_literal_global_7);
    }
    if (isMemoryLessStorageDisabled_result) {
      a3 = 2;
    }
    else {
      a3 = 3;
    }
  }
  self->_private.unint64_t resourceOptions = self->_private.resourceOptions & 0xFFFFFFFFFFFFFF0FLL | (16 * a3);
  self->_private.storageMode = a3;
}

- (void)setCpuCacheMode:(unint64_t)a3
{
  self->_private.unint64_t resourceOptions = self->_private.resourceOptions & 0xFFFFFFFFFFFFFFF0 | a3;
  self->_private.cpuCacheMode = a3;
}

- (void)setArrayLength:(unint64_t)a3
{
  self->_private.unint64_t arrayLength = a3;
}

- (unint64_t)mipmapLevelCount
{
  return self->_private.mipmapLevelCount;
}

- (unint64_t)width
{
  return self->_private.width;
}

- (unint64_t)arrayLength
{
  return self->_private.arrayLength;
}

- (unint64_t)height
{
  return self->_private.height;
}

- (void)setDepth:(unint64_t)a3
{
  self->_private.unint64_t depth = a3;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_private.sampleCount = a3;
}

- (void)setSwizzle:(id)a3
{
  self->_private.swizzle = a3;
}

- (void)setAllowGPUOptimizedContents:(BOOL)a3
{
  self->_private.allowGPUOptimizedContents = a3;
}

- (unint64_t)depth
{
  return self->_private.depth;
}

- (void)setHazardTrackingMode:(unint64_t)a3
{
  self->_private.unint64_t resourceOptions = self->_private.resourceOptions & 0xFFFFFFFFFFFFFCFFLL | (a3 << 8);
}

- (void)setCompressionType:(int64_t)a3
{
  self->_private.compressionMode = 0;
  unint64_t v3 = 3;
  if (a3 != 1) {
    unint64_t v3 = 0;
  }
  self->_private.unint64_t compressionFootprint = v3;
  self->_private.unint64_t compressionType = a3;
}

- (unint64_t)sampleCount
{
  return self->_private.sampleCount;
}

- (void)setRotation:(unint64_t)a3
{
  self->_private.rotation = a3;
}

- (void)setIsDrawable:(BOOL)a3
{
  self->_private.isDrawable = a3;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  self->_private.framebufferOnly = a3;
}

- (void)setResourceOptions:(unint64_t)a3
{
  if (!dyld_program_sdk_at_least()) {
    a3 &= 0xFFFFFFFFFFFFFCFFLL;
  }
  unint64_t v5 = a3 >> 4;
  if (v5 == 3)
  {
    if (isMemoryLessStorageDisabled_onceToken != -1) {
      dispatch_once(&isMemoryLessStorageDisabled_onceToken, &__block_literal_global_7);
    }
    unint64_t v5 = 2;
    if (!isMemoryLessStorageDisabled_result) {
      unint64_t v5 = 3;
    }
  }
  self->_private.unint64_t resourceOptions = a3 & 0xFFFFFFFFFFFFFF0FLL | (16 * v5);
  self->_private.cpuCacheMode = a3 & 0xF;
  self->_private.storageMode = v5;
}

- (id)formattedDescription:(unint64_t)a3
{
  v23[60] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  unint64_t v5 = NSString;
  v22.receiver = self;
  v22.super_class = (Class)MTLTextureDescriptorInternal;
  id v6 = [(MTLTextureDescriptorInternal *)&v22 description];
  v23[0] = v4;
  v23[1] = @"textureType =";
  unint64_t textureType = self->_private.textureType;
  if (textureType > 9) {
    unint64_t v8 = @"Unknown";
  }
  else {
    unint64_t v8 = (__CFString *)*((void *)&off_1E52209A8 + textureType);
  }
  v23[2] = v8;
  v23[3] = v4;
  v23[4] = @"pixelFormat =";
  v23[5] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_private.pixelFormat)];
  v23[6] = v4;
  v23[7] = @"width =";
  v23[8] = [NSNumber numberWithUnsignedInteger:self->_private.width];
  v23[9] = v4;
  v23[10] = @"height =";
  v23[11] = [NSNumber numberWithUnsignedInteger:self->_private.height];
  v23[12] = v4;
  v23[13] = @"depth =";
  v23[14] = [NSNumber numberWithUnsignedInteger:self->_private.depth];
  v23[15] = v4;
  v23[16] = @"mipmapLevelCount =";
  v23[17] = [NSNumber numberWithUnsignedInteger:self->_private.mipmapLevelCount];
  v23[18] = v4;
  v23[19] = @"sampleCount =";
  v23[20] = [NSNumber numberWithUnsignedInteger:self->_private.sampleCount];
  v23[21] = v4;
  v23[22] = @"arrayLength =";
  v23[23] = [NSNumber numberWithUnsignedInteger:self->_private.arrayLength];
  v23[24] = v4;
  v23[25] = @"cpuCacheMode =";
  unint64_t v9 = [(MTLTextureDescriptorInternal *)self cpuCacheMode];
  uint64_t v10 = @"MTLCPUCacheModeDefaultCache";
  if (v9) {
    uint64_t v10 = @"Invalid";
  }
  if (v9 == 1) {
    uint64_t v10 = @"MTLCPUCacheModeWriteCombined";
  }
  v23[26] = v10;
  v23[27] = v4;
  v23[28] = @"storageMode =";
  unint64_t v11 = [(MTLTextureDescriptorInternal *)self storageMode];
  uint64_t v12 = @"Invalid";
  if (v11 <= 3) {
    uint64_t v12 = (__CFString *)*((void *)&off_1E5220988 + v11);
  }
  v23[29] = v12;
  v23[30] = v4;
  v23[31] = @"hazardTrackingMode =";
  v23[32] = MTLHazardTrackingModeString([(MTLTextureDescriptorInternal *)self hazardTrackingMode]);
  v23[33] = v4;
  v23[34] = @"resourceOptions =";
  v23[35] = MTLResourceOptionsString(self->_private.resourceOptions);
  v23[36] = v4;
  v23[37] = @"framebufferOnly =";
  v23[38] = [NSNumber numberWithBool:self->_private.framebufferOnly];
  v23[39] = v4;
  v23[40] = @"usage =";
  v23[41] = MTLTextureUsageString(self->_private.var0.textureUsage);
  v23[42] = v4;
  v23[43] = @"swizzle =";
  v23[44] = MTLTextureSwizzleString(self->_private.swizzle);
  v23[45] = v4;
  unint64_t sparseSurfaceDefaultValue = self->_private.sparseSurfaceDefaultValue;
  unint64_t v14 = @"MTLUnmappedDepthValueOne";
  if (sparseSurfaceDefaultValue != 1) {
    unint64_t v14 = @"Invalid";
  }
  BOOL v15 = sparseSurfaceDefaultValue == 0;
  uint64_t v16 = @"MTLUnmappedDepthValueZero";
  if (!v15) {
    uint64_t v16 = v14;
  }
  v23[46] = @"sparseSurfaceDefaultValue =";
  v23[47] = v16;
  v23[48] = v4;
  v23[49] = @"allowGPUOptimizedContents =";
  uint64_t v17 = @"YES";
  if (!self->_private.allowGPUOptimizedContents) {
    uint64_t v17 = @"NO";
  }
  v23[50] = v17;
  v23[51] = v4;
  v23[52] = @"forceResourceIndex =";
  v23[53] = [NSNumber numberWithBool:self->_private.forceResourceIndex];
  v23[54] = v4;
  v23[55] = @"resourceIndex =";
  v23[56] = [NSNumber numberWithUnsignedLongLong:self->_private.resourceIndex];
  v23[57] = v4;
  int64_t compressionType = self->_private.compressionType;
  uint64_t v19 = @"MTLTextureCompressionTypeLossy";
  if (compressionType != 1) {
    uint64_t v19 = @"Invalid";
  }
  if (compressionType) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = @"MTLTextureCompressionTypeLossless";
  }
  v23[58] = @"compressionType =";
  v23[59] = v20;
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 60), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3) && memcmp(&self->_private, (char *)a3 + 8, 0xB0uLL) == 0;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_private, 0xB0uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_private.textureType;
    long long v5 = *(_OWORD *)&self->_private.zeroFill;
    long long v7 = *(_OWORD *)&self->_private.width;
    long long v6 = *(_OWORD *)&self->_private.depth;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_private.sampleCount;
    *(_OWORD *)((char *)result + 72) = v5;
    *(_OWORD *)((char *)result + 24) = v7;
    *(_OWORD *)((char *)result + 40) = v6;
    long long v8 = *(_OWORD *)&self->_private.allowGPUOptimizedContents;
    long long v10 = *(_OWORD *)&self->_private.framebufferOnly;
    long long v9 = *(_OWORD *)&self->_private.compressionMode;
    *(_OWORD *)((char *)result + 120) = *(_OWORD *)&self->_private.resourceOptions;
    *(_OWORD *)((char *)result + 136) = v8;
    *(_OWORD *)((char *)result + 88) = v10;
    *(_OWORD *)((char *)result + 104) = v9;
    long long v12 = *(_OWORD *)&self->_private.compressionType;
    long long v11 = *(_OWORD *)&self->_private.resolvedUsage;
    long long v13 = *(_OWORD *)&self->_private.protectionOptions;
    *((void *)result + 25) = self->_private.storageMode;
    *(_OWORD *)((char *)result + 168) = v12;
    *(_OWORD *)((char *)result + 184) = v11;
    *(_OWORD *)((char *)result + 152) = v13;
  }
  return result;
}

- (id)description
{
  return [(MTLTextureDescriptorInternal *)self formattedDescription:0];
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return self->_private.sparseSurfaceDefaultValue;
}

- (void)setSparseSurfaceDefaultValue:(unint64_t)a3
{
  self->_private.unint64_t sparseSurfaceDefaultValue = a3;
}

- (BOOL)allowGPUOptimizedContents
{
  return self->_private.allowGPUOptimizedContents;
}

- (BOOL)forceResourceIndex
{
  return self->_private.forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_private.forceResourceIndex = a3;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (unint64_t)hazardTrackingMode
{
  return (self->_private.resourceOptions >> 8) & 3;
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)self->_private.swizzle;
}

- (void)setSwizzleKey:(unsigned int)a3
{
  self->_private.swizzle = a3;
}

- (unsigned)swizzleKey
{
  return self->_private.swizzle;
}

- (void)setWriteSwizzleEnabled:(BOOL)a3
{
  self->_private.writeSwizzleEnabled = a3;
}

- (BOOL)writeSwizzleEnabled
{
  return self->_private.writeSwizzleEnabled;
}

- (void)setCompressionMode:(unint64_t)a3
{
  self->_private.compressionMode = a3;
}

- (void)setCompressionFootprint:(unint64_t)a3
{
  self->_private.unint64_t compressionFootprint = a3;
}

- (int64_t)compressionType
{
  return self->_private.compressionType;
}

- (unint64_t)colorSpaceConversionMatrix
{
  return self->_private.colorSpaceConversionMatrix;
}

- (void)setColorSpaceConversionMatrix:(unint64_t)a3
{
  self->_private.colorSpaceConversionMatrix = a3;
}

- (BOOL)framebufferOnly
{
  return self->_private.framebufferOnly;
}

- (BOOL)isDrawable
{
  return self->_private.isDrawable;
}

@end