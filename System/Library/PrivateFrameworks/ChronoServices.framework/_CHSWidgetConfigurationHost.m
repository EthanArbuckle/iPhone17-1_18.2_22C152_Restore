@interface _CHSWidgetConfigurationHost
- (CHSWidgetMetricsSpecification)metricsSpecification;
- (NSArray)widgetConfigurations;
- (NSString)identifier;
- (_CHSWidgetConfigurationHost)initWithIdentifier:(id)a3 configurations:(id)a4 metricsSpecification:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)widgetConfigurationsForApplicationContainerBundleIdentifier:(id)a3;
@end

@implementation _CHSWidgetConfigurationHost

- (_CHSWidgetConfigurationHost)initWithIdentifier:(id)a3 configurations:(id)a4 metricsSpecification:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_CHSWidgetConfigurationHost;
  v11 = [(_CHSWidgetConfigurationHost *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    configurations = v11->_configurations;
    v11->_configurations = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    metricsSpecification = v11->_metricsSpecification;
    v11->_metricsSpecification = (CHSWidgetMetricsSpecification *)v16;
  }
  return v11;
}

- (NSString)identifier
{
  v2 = (void *)[(NSString *)self->_identifier copy];
  return (NSString *)v2;
}

- (NSArray)widgetConfigurations
{
  v2 = (void *)[(NSArray *)self->_configurations copy];
  return (NSArray *)v2;
}

- (id)widgetConfigurationsForApplicationContainerBundleIdentifier:(id)a3
{
  id v4 = a3;
  configurations = self->_configurations;
  v6 = (void *)MEMORY[0x1E4F28F60];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91___CHSWidgetConfigurationHost_widgetConfigurationsForApplicationContainerBundleIdentifier___block_invoke;
  v11[3] = &unk_1E56C8F40;
  id v7 = v4;
  id v12 = v7;
  id v8 = [v6 predicateWithBlock:v11];
  id v9 = [(NSArray *)configurations filteredArrayUsingPredicate:v8];

  return v9;
}

- (CHSWidgetMetricsSpecification)metricsSpecification
{
  v2 = (void *)[(CHSWidgetMetricsSpecification *)self->_metricsSpecification copy];
  return (CHSWidgetMetricsSpecification *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_CHSWidgetConfigurationHost alloc];
  identifier = self->_identifier;
  configurations = self->_configurations;
  metricsSpecification = self->_metricsSpecification;
  return [(_CHSWidgetConfigurationHost *)v4 initWithIdentifier:identifier configurations:configurations metricsSpecification:metricsSpecification];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsSpecification, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end