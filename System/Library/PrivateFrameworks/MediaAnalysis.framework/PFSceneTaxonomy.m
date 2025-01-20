@interface PFSceneTaxonomy
@end

@implementation PFSceneTaxonomy

void __52__PFSceneTaxonomy_MediaAnalysis__vcp_sharedTaxonomy__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend((id)objc_opt_class(), "mad_isExpectedTaxonomy") & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v0 = VCPLogInstance();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v0, OS_LOG_TYPE_ERROR, "Error: MAD tracked taxonomy is not the latest in Photos!", buf, 2u);
    }
  }
  v1 = [MEMORY[0x1E4F8CD58] latestTaxonomyIdentifier];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v1;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Loading PFSceneTaxonomy identifier %@", buf, 0xCu);
    }
  }
  id v8 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8CD58]) initWithIdentifier:v1 error:&v8];
  id v4 = v8;
  v5 = (void *)+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance;
  +[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance = v3;

  if ((!+[PFSceneTaxonomy(MediaAnalysis) vcp_sharedTaxonomy]::instance || v4) && (int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [v4 description];
      *(_DWORD *)buf = 138412546;
      v10 = v1;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Failed to initialize PFSceneTaxonomy w/identifier %@ (%@)", buf, 0x16u);
    }
  }
}

void __56__PFSceneTaxonomy_MediaAnalysis__mad_isExpectedTaxonomy__block_invoke()
{
  v0 = [MEMORY[0x1E4F8CD58] latestTaxonomyIdentifier];
  +[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::isLatest = [@"99" isEqualToString:v0];
  if ((+[PFSceneTaxonomy(MediaAnalysis) mad_isExpectedTaxonomy]::isLatest & 1) == 0)
  {
    v1 = VCPLogInstance();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
      __56__PFSceneTaxonomy_MediaAnalysis__mad_isExpectedTaxonomy__block_invoke_cold_1((uint64_t)v0, v1);
    }
  }
}

void __56__PFSceneTaxonomy_MediaAnalysis__mad_isExpectedTaxonomy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = @"99";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1BBEDA000, a2, OS_LOG_TYPE_FAULT, "Error: MAD tracked taxonomy identifier %@ does not match the latest in Photos: %@!", (uint8_t *)&v2, 0x16u);
}

@end