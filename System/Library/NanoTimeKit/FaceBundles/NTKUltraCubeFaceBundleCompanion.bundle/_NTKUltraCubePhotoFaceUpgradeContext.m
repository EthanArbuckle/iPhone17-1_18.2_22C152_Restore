@interface _NTKUltraCubePhotoFaceUpgradeContext
- (NSString)albumIdentifier;
- (NSString)description;
- (NTKComplication)bottomComplication;
- (NTKComplication)topComplication;
- (NTKPigmentEditOption)colorOption;
- (_NTKUltraCubePhotoFaceUpgradeContext)initWithReader:(id)a3 topComplication:(id)a4 bottomComplication:(id)a5 colorEffectOption:(id)a6 colorOption:(id)a7 typefaceOption:(id)a8;
- (id)itemAtIndex:(unint64_t)a3;
- (int64_t)colorEffect;
- (int64_t)contentType;
- (int64_t)typeface;
- (unint64_t)numberOfItems;
@end

@implementation _NTKUltraCubePhotoFaceUpgradeContext

- (_NTKUltraCubePhotoFaceUpgradeContext)initWithReader:(id)a3 topComplication:(id)a4 bottomComplication:(id)a5 colorEffectOption:(id)a6 colorOption:(id)a7 typefaceOption:(id)a8
{
  id v30 = a3;
  id v29 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_NTKUltraCubePhotoFaceUpgradeContext;
  v19 = [(_NTKUltraCubePhotoFaceUpgradeContext *)&v31 init];
  v20 = v19;
  if (!v19) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v19->_reader, a3);
  objc_storeStrong((id *)&v20->_topComplication, a4);
  objc_storeStrong((id *)&v20->_bottomComplication, a5);
  if (!objc_msgSend(v16, "colorEffect", v29, v30)
    || ([v17 optionName],
        v21 = objc_claimAutoreleasedReturnValue(),
        +[NTKPhotosColorEditOption originalColorName],
        v22 = objc_claimAutoreleasedReturnValue(),
        unsigned int v23 = [v21 isEqualToString:v22],
        v22,
        v21,
        v23))
  {
    v20->_colorEffect = 0;
    goto LABEL_13;
  }
  if ([v17 isMultitoneOption])
  {
    uint64_t v24 = 3;
LABEL_11:
    v20->_colorEffect = v24;
    goto LABEL_12;
  }
  v25 = (char *)[v16 colorEffect];
  if (v25 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v24 = 2;
    goto LABEL_11;
  }
  if (v25 == (unsigned char *)&dword_0 + 2)
  {
    uint64_t v24 = 1;
    goto LABEL_11;
  }
LABEL_12:
  objc_storeStrong((id *)&v20->_colorOption, a7);
LABEL_13:
  v20->_typeface = 0;
  id v26 = [v18 typeface];
  if ((unint64_t)v26 <= 2) {
    v20->_typeface = (int64_t)v26 + 1;
  }
LABEL_15:
  v27 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v20;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
  }

  return v20;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"_NTKUltraCubePhotoFaceUpgradeContext[%ld photos]", [(NTKUltraCubePhotosReader *)self->_reader count]];
}

- (int64_t)contentType
{
  return 1;
}

- (NSString)albumIdentifier
{
  return 0;
}

- (NTKComplication)topComplication
{
  return self->_topComplication;
}

- (NTKComplication)bottomComplication
{
  return self->_bottomComplication;
}

- (int64_t)colorEffect
{
  return self->_colorEffect;
}

- (NTKPigmentEditOption)colorOption
{
  return self->_colorOption;
}

- (int64_t)typeface
{
  return self->_typeface;
}

- (unint64_t)numberOfItems
{
  return [(NTKUltraCubePhotosReader *)self->_reader count];
}

- (id)itemAtIndex:(unint64_t)a3
{
  v3 = [(NTKUltraCubePhotosReader *)self->_reader objectAtIndexedSubscript:a3];
  if (v3) {
    v4 = [[_NTKUltraCubePhotoFaceUpgradeItemContext alloc] initWithPhoto:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorOption, 0);
  objc_storeStrong((id *)&self->_bottomComplication, 0);
  objc_storeStrong((id *)&self->_topComplication, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end