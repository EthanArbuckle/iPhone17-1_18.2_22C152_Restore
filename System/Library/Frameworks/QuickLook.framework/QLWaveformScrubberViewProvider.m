@interface QLWaveformScrubberViewProvider
+ (void)generateWaveformForWidth:(double)a3 asset:(id)a4 updateHandler:(id)a5;
- (id)createFilmstripViewForVideoScrubberView:(id)a3;
@end

@implementation QLWaveformScrubberViewProvider

- (id)createFilmstripViewForVideoScrubberView:(id)a3
{
  v3 = [QLWaveformView alloc];
  v4 = -[QLWaveformView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  return v4;
}

+ (void)generateWaveformForWidth:(double)a3 asset:(id)a4 updateHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (NSObject **)MEMORY[0x263F62940];
  v10 = *MEMORY[0x263F62940];
  double v11 = a3 / 3.0;
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_DEFAULT, "Generating waveforms... #Waveform", buf, 2u);
  }
  if ((unint64_t)v11)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __79__QLWaveformScrubberViewProvider_generateWaveformForWidth_asset_updateHandler___block_invoke;
    v18 = &unk_2642F63D8;
    unint64_t v20 = (unint64_t)v11;
    id v19 = v8;
    id v12 = v7;
    v13 = &v15;
    uint64_t v14 = *MEMORY[0x263EF9CE8];
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    v23 = __QLWaveformDeterminePowerLevelsForAsset_block_invoke;
    v24 = &unk_2642F6428;
    v26 = v13;
    unint64_t v27 = (unint64_t)v11;
    id v25 = v12;
    objc_msgSend(v12, "loadTracksWithMediaType:completionHandler:", v14, buf, v15, v16, v17, v18);
  }
}

void __79__QLWaveformScrubberViewProvider_generateWaveformForWidth_asset_updateHandler___block_invoke(uint64_t a1, uint64_t a2, void *__src)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  if ((unint64_t)(0x2FC962FC962FC963 * a2) < 0x369D0369D0369D1 || (v5 = v4 == a2, uint64_t v4 = a2, v5))
  {
    v6 = (char *)v14 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      memcpy(v6, __src, 8 * v7);
      id v8 = (double *)v6;
      unint64_t v9 = v7;
      do
      {
        *id v8 = fmax(*v8 + -30.0, 0.0);
        ++v8;
        --v9;
      }
      while (v9);
      v10 = (double *)v6;
      unint64_t v11 = v7;
      do
      {
        double *v10 = *v10 / 10000.0;
        ++v10;
        --v11;
      }
      while (v11);
    }
    id v12 = objc_msgSend(MEMORY[0x263F825C8], "systemGrayColor", __src);
    v13 = QLWaveformWithPowerLevels((uint64_t)v6, v7, v12);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end